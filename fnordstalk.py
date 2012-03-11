#!/usr/bin/env python
# encoding: utf-8
"""
fnordstalk.py

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

import getopt
import re
import sys
from stalk import Stalk
import datetime
import time

help_message = '''
fnordstalk
===============

Monitor your beanstalk instance and report to fnordmetric.

Other Options:
-h                          This help message
-u, --username [username]   set your username
-p, --password [password]   set your password
-i, --ignore  [regular exp] ignore files that match this regex
'''
        
class Usage(Exception):
    def __init__(self, msg):
        self.msg = msg


def main(argv=None):
    if argv is None:
        argv = sys.argv
    try:
        try:
            opts, args = getopt.getopt(argv[1:], "h:v", [
                "help",
                "beanstalk_host=",
                "beanstalk_port=",
                "redis_host=",
                'redis_port=',
                'redis_db=',
                'generate_config'
                ])
        except getopt.error, msg:
            raise Usage(msg)
    
        beanstalk_host = "localhost"
        beanstalk_port = 11300
        redis_host = "localhost"
        redis_port = 6379
        redis_db = 0
        generate_config = False

        # option processing
        for option, value in opts:
            if option == "-v":
                verbose = True
            if option in ("-h", "--help"):
                raise Usage(help_message)
            if option in ("--beanstalk_host"):
                beanstalk_host = value
            if option in ("--beanstalk_port"):
                try:
                    beanstalk_port = int(value)
                except:
                    Usage("port must be an integer")
            if option in ("--redis_host"):
                redis_host = value
            if option in ("--redis_port"):
                try:
                    redis_port = int(value)
                except:
                    Usage("port must be an integer")
            if option in ("--redis_db"):
                try:
                    redis_db = int(value)
                except:
                    Usage("db must be an integer")
            if option in ("--generate_config"):
                generate_config = True
        
        # Start the actual work
        stalk = Stalk(beanstalk_host, beanstalk_port,
                      redis_host, redis_port, redis_db)
        
        if generate_config:
            print stalk.generate_config()
        else:
            while True:
                stalk.send_stats_global()
                for tube in stalk.tubes():
                    stalk.send_stats_tube(tube)
                print '%s\tSent to beanstalk'%(datetime.datetime.now().isoformat())
                # TODO(sholiday): much better ways to do this...
                time.sleep(60)
    except Usage, err:
        print >> sys.stderr, sys.argv[0].split("/")[-1] + ": " + str(err.msg)
        print >> sys.stderr, "\t for help use --help"
        return 2
    
if __name__ == "__main__":
    sys.exit(main())