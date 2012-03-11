#!/usr/bin/env python
     
from setuptools import setup, find_packages

setup(name='fnordstalk',
    version='0.0.4',
    description='A tool to save beanstalk stats to fnordmetric',
    author='Stephen Holiday',
    author_email='stephen.holiday@gmail.com',
    url='https://github.com/sholiday/fnordstalk',
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
   py_modules=['stalk'],
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
   long_description = """
   A tool to save beanstalk stats to fnordmetric
   """
)