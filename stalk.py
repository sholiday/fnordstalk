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
        
    def send_stats_global(self,
        collect = ["cmd-bury", "cmd-put", "cmd-release",
                   "cmd-reserve", "current-connections",
                   "current-jobs-buried", "current-jobs-ready",
                   "current-workers", "job-timeouts", "total-jobs"]
        ):
        """
        Sends stats for the beanstalkd process
        """
        
        stats = self._beanstalk.stats()
        
        for stat in collect:
            self.event_tube("global", stat, stats[stat])
        
    def send_stats_tube(self, tube,
        collect = ["current-jobs-buried", "current-jobs-ready",
                   "current-watching", "current-using", "total-jobs"]
        ):
        """
        Send stats for a specified tube.
        """
        
        stats = self._beanstalk.stats_tube(tube)
        
        for stat in collect:
            self.event_tube(tube, stat, stats[stat])

if __name__ == "__main__":
    stalk = Stalk()
    
    stalk.send_stats_global()