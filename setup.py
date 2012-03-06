#!/usr/bin/env python
     
from setuptools import setup, find_packages

setup(name='fnordstalk',
    version='0.0.1',
    description='A tool to save beanstalk stats to fnordmetric',
    author='Stephen Holiday',
    author_email='stephen.holiday@gmail.com',
    url='https://github.com/sholiday/fnordstalk',
    py_modules=['monitor.py'],
    install_requires=(
        'pyfnordmetric',
        'beanstalkc'
    ),
    scripts=['fnordstalk.py'],
       entry_points={
           'console_scripts': [
               'fnordstalk = fnordstalk:main',
           ]
       },
   classifiers=[
         'Development Status :: 3 - Alpha',
         'Intended Audience :: Developers',
         'License :: OSI Approved :: Apache Software License',
         'Operating System :: MacOS :: MacOS X',
         'Operating System :: POSIX',
         'Operating System :: Unix',
         'Programming Language :: Python :: 2.6',
         'Programming Language :: Python :: 2.7',
         'Programming Language :: Python',
         'Topic :: System :: Monitoring',
   ],
   download_url="https://github.com/sholiday/fnordstalk/tarball/master",
   long_description = """
   A tool to save beanstalk stats to fnordmetric
   """
)