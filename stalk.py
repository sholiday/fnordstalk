#!/usr/bin/env python
# encoding: utf-8
"""
stalk.py

Copyright 2012 Stephen Holiday

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
"""

import beanstalkc
import fnordmetric

class Stalk:
    """
    A class that communicates with both beanstalkd and redis (fnordmetric)
    """
    _beanstalk = None
    _fnordmetric = None
    global_collect = {
        "cmd-bury" : {"title": "Global Buries", "type":"total"},
        "cmd-put" : {"title": "Global Puts", "type":"total"},
        "cmd-reserve" : {"title": "Global Reserves", "type":"total"},
        "current-connections" : {"title": "Current Connections", "type":"current"},
        "current-jobs-buried" : {"title": "Current Jobs Buried", "type":"current"},
        "current-jobs-ready" : {"title": "Current Jobs Ready", "type":"current"},
        "current-workers" : {"title": "Current Workers", "type":"current"},
        "job-timeouts" : {"title": "Job Timeouts", "type":"total"},
        "total-jobs" : {"title": "Global Jobs", "type":"total"},
        }
    
    tube_collect = {
        "current-jobs-buried" : {"title":"Burried", "type":"current"},
        "current-jobs-ready" : {"title":"Ready", "type":"current"},
        "current-watching" : {"title":"Watchers", "type":"current"},
        "current-using" : {"title":"Using", "type":"current"},
        "total-jobs" : {"title":"Total Jobs", "type":"total"},
    }
    global_widgets = [
        {"title":"Commands", "gauges":["cmd-bury", "cmd-put", "cmd-reserve"], "type":"timeline", "width":50, "time":"minute"},
        {"title":"Users", "gauges":["current-jobs-ready", "current-jobs-buried"], "type":"timeline", "width":50, "time":"minute"},
        {"title":"Jobs", "gauges":["total-jobs"], "type":"timeline", "width":50, "isTotal":True, "time":"hour"},
    ]
        
    tube_widgets = [
        {"title":"Jobs", "gauges":["current-jobs-ready", "current-jobs-buried"], "type":"timeline", "width":50, "time":"minute"},
        {"title":"Users", "gauges":["current-watching", "current-using"], "type":"timeline", "width":50, "time":"hour"},
        {"title":"Jobs Total", "gauges":["total-jobs"], "type":"timeline", "width":50, "time":"hour"},
    ]
    
                    
    def __init__(self, beanstalk_host = "localhost", beanstalk_port = 11300,
                 redis_host = "localhost", redis_port = 6379, redis_db = 0):
        self._beanstalk = beanstalkc.Connection(host = beanstalk_host,
                                                port = beanstalk_port)
            
        self._fnordmetric = fnordmetric.Fnordmetric(host = redis_host,
                                                    port = redis_port,
                                                    db = redis_db)
    
    def event_tube(self, tube, stat, value):
        eventtype = "fnordstalk_%s_%s" % (tube, stat.replace("-", "_"))
        
        self._event_num(eventtype, value)
    
    def _event_num(self, eventtype, value):
        print (eventtype, value)
        event = {"_type":eventtype, "value":value}
        self._fnordmetric.queue_event(event)
    
    def tubes(self):
        """
        Return a list of all tube names
        """
        return self._beanstalk.tubes()
        
    def send_stats_global(self, collect = global_collect.keys()):
        """
        Sends stats for the beanstalkd process
        """
        
        stats = self._beanstalk.stats()
        
        for stat in collect:
            self.event_tube("global", stat, stats[stat])
        
    def send_stats_tube(self, tube, collect = tube_collect.keys()):
        """
        Send stats for a specified tube.
        """
        
        stats = self._beanstalk.stats_tube(tube)
        
        for stat in collect:
            self.event_tube(tube, stat, stats[stat])
            
    def generate_config(self, tubes = ['markArticleRead', 'recommendArticle', 'cleanArticle', 'regenerateModels', 'addFeed', 'updateFeed', 'updateUserFeeds', 'notifySubscribers']):
        ret = '# fnordstalk config\n'
        for name, conf in self.global_collect.items():
            name = 'fnordstalk_global_%s'%(name.replace("-", "_"))
            ret += self._generate_gauges(name, conf["title"], conf['type'])
            ret += self._generate_event_listener(name, conf["title"], conf['type'])
            ret += '\n'
        
        for tube in tubes:
            for name, conf in self.tube_collect.items():
                name = 'fnordstalk_%s_%s'%(tube, name.replace("-", "_"))
                ret += self._generate_gauges(name, conf["title"], conf['type'])
                ret += self._generate_event_listener(name, conf["title"], conf['type'])
                ret += '\n'
        
        for widget in self.global_widgets:
            gauges = map(lambda gauge: 'fnordstalk_global_%s_%s'%(gauge.replace("-", "_"), widget['time']), widget['gauges'])
            #{"title":"Commands", "gauges":["cmd-bury", "cmd-put", "cmd-reserve"], "type":"timeline", "width":50},
            ret += self._generate_widget(widget['title'], gauges, widget['width'], widget['type'])
            
        for tube in tubes:
            for widget in self.tube_widgets:
                gauges = map(lambda gauge: 'fnordstalk_%s_%s_%s'%(tube, gauge.replace("-", "_"), widget['time']), widget['gauges'])
                #{"title":"Commands", "gauges":["cmd-bury", "cmd-put", "cmd-reserve"], "type":"timeline", "width":50},
                ret += self._generate_widget('%s - %s'%(tube, widget['title']), gauges, widget['width'], widget['type'])
        #ret += self._generate_widget('Thing', ['fnord', 'fnordd'])
        return ret
        
    def _generate_gauges(self, name, title, stat_type):
        ret =  '# fnordstalk Gauge for %s\n'%(title)
        ret += 'gauge :%s_minute, :tick => 60, :title => "%s (min)"\n'%(name, title)
        ret += 'gauge :%s_hour, :tick => 1.hour.to_i, :title => "%s (hr)"\n'%(name, title)
        ret += 'gauge :%s_day, :tick => 1.day.to_i, :title => "%s (day)"\n'%(name, title)
        ret += '\n'
        return ret
        
    def _generate_event_listener(self, name, title, stat_type):
        ret =  '# fnordstalk Event Listener for %s\n'%title
        ret += 'event(:%s) do\n'%name
        if (stat_type == "current"):
            ret += '  incr :%s_minute, data[:value]\n'%name
            ret += '  incr :%s_hour, data[:value]\n'%name
            ret += '  incr :%s_day, data[:value]\n'%name
        elif (stat_type == "total"):
            ret += '  set_value(:%s_minute, data[:value])\n'%name
            ret += '  set_value(:%s_hour, data[:value])\n'%name
            ret += '  set_value(:%s_day, data[:value])\n'%name
        ret += 'end\n'
        return ret
        
    def _generate_widget(self, title, gauges, width=50, widget_type = 'timeline', offsets = None):
        gauges = '[' + ', '.join(map(lambda gauge: ':'+gauge, gauges)) + ']'
        ret = '# Widget for %s\n' % title
        ret += 'widget "Beanstalk", {\n'
        ret += '  :title => "%s",\n' % title
        ret += '  :type => :%s,\n' % widget_type
        ret += '  :width => %s,\n' % width
        ret += '  :gauges => %s,\n' % gauges
        ret += '  :include_current => true,\n'
        ret += '  :autoupdate => 60\n'
        if offsets is not None:
            ret += '  :offsets => %s,'%('[' + ','.join(offsets
            
            ) + ']')
        ret += '}\n'
        ret += '\n'
        return ret
if __name__ == "__main__":
    stalk = Stalk()
    
    stalk.send_stats_global()