# fnordstalk
Monitor your beanstalk instance and report to fnordmetric.

## Generating a Config
It can take a bit of work to generate a configuration,
so there's a cool option that looks at your beanstalk instance and spits out a basic configuration.

    python fnordstalk.py --generate_config
    
And bam, a huge config pops out, an example is in `doc/example.rb`.


## Tube Stats
* cmd-pause-tube
* current-jobs-buried
* current-jobs-delayed
* current-jobs-ready
* current-jobs-reserved
* current-jobs-urgent
* current-using
* current-waiting
* current-watching
* name
* pause
* pause-time-left
* total-jobs

## Global Stats
* binlog-current-index
* binlog-max-size
* binlog-oldest-index
* cmd-bury
* cmd-delete
* cmd-ignore
* cmd-kick
* cmd-list-tube-used
* cmd-list-tubes
* cmd-list-tubes-watched
* cmd-pause-tube
* cmd-peek
* cmd-peek-buried
* cmd-peek-delayed
* cmd-peek-ready
* cmd-put
* cmd-release
* cmd-reserve
* cmd-reserve-with-timeout
* cmd-stats
* cmd-stats-job
* cmd-stats-tube
* cmd-touch
* cmd-use
* cmd-watch
* current-connections
* current-jobs-buried
* current-jobs-delayed
* current-jobs-ready
* current-jobs-reserved
* current-jobs-urgent
* current-producers
* current-tubes
* current-waiting
* current-workers
* job-timeouts
* max-job-size
* pid
* rusage-stime
* rusage-utime
* total-connections
* total-jobs
* uptime
* version