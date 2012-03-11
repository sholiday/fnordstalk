require "fnordmetric"

FnordMetric.namespace :myapp do
  # fnordstalk config
  # fnordstalk Gauge for Current Connections
  gauge :fnordstalk_global_current_connections_minute, :tick => 60, :title => "Current Connections (min)"
  gauge :fnordstalk_global_current_connections_hour, :tick => 1.hour.to_i, :title => "Current Connections (hr)"
  gauge :fnordstalk_global_current_connections_day, :tick => 1.day.to_i, :title => "Current Connections (day)"

  # fnordstalk Event Listener for Current Connections
  event(:fnordstalk_global_current_connections) do
    incr :fnordstalk_global_current_connections_minute, data[:value]
    incr :fnordstalk_global_current_connections_hour, data[:value]
    incr :fnordstalk_global_current_connections_day, data[:value]
  end

  # fnordstalk Gauge for Current Jobs Ready
  gauge :fnordstalk_global_current_jobs_ready_minute, :tick => 60, :title => "Current Jobs Ready (min)"
  gauge :fnordstalk_global_current_jobs_ready_hour, :tick => 1.hour.to_i, :title => "Current Jobs Ready (hr)"
  gauge :fnordstalk_global_current_jobs_ready_day, :tick => 1.day.to_i, :title => "Current Jobs Ready (day)"

  # fnordstalk Event Listener for Current Jobs Ready
  event(:fnordstalk_global_current_jobs_ready) do
    incr :fnordstalk_global_current_jobs_ready_minute, data[:value]
    incr :fnordstalk_global_current_jobs_ready_hour, data[:value]
    incr :fnordstalk_global_current_jobs_ready_day, data[:value]
  end

  # fnordstalk Gauge for Job Timeouts
  gauge :fnordstalk_global_job_timeouts_minute, :tick => 60, :title => "Job Timeouts (min)"
  gauge :fnordstalk_global_job_timeouts_hour, :tick => 1.hour.to_i, :title => "Job Timeouts (hr)"
  gauge :fnordstalk_global_job_timeouts_day, :tick => 1.day.to_i, :title => "Job Timeouts (day)"

  # fnordstalk Event Listener for Job Timeouts
  event(:fnordstalk_global_job_timeouts) do
    set_value(:fnordstalk_global_job_timeouts_minute, data[:value])
    set_value(:fnordstalk_global_job_timeouts_hour, data[:value])
    set_value(:fnordstalk_global_job_timeouts_day, data[:value])
  end

  # fnordstalk Gauge for Global Jobs
  gauge :fnordstalk_global_total_jobs_minute, :tick => 60, :title => "Global Jobs (min)"
  gauge :fnordstalk_global_total_jobs_hour, :tick => 1.hour.to_i, :title => "Global Jobs (hr)"
  gauge :fnordstalk_global_total_jobs_day, :tick => 1.day.to_i, :title => "Global Jobs (day)"

  # fnordstalk Event Listener for Global Jobs
  event(:fnordstalk_global_total_jobs) do
    set_value(:fnordstalk_global_total_jobs_minute, data[:value])
    set_value(:fnordstalk_global_total_jobs_hour, data[:value])
    set_value(:fnordstalk_global_total_jobs_day, data[:value])
  end

  # fnordstalk Gauge for Global Reserves
  gauge :fnordstalk_global_cmd_reserve_minute, :tick => 60, :title => "Global Reserves (min)"
  gauge :fnordstalk_global_cmd_reserve_hour, :tick => 1.hour.to_i, :title => "Global Reserves (hr)"
  gauge :fnordstalk_global_cmd_reserve_day, :tick => 1.day.to_i, :title => "Global Reserves (day)"

  # fnordstalk Event Listener for Global Reserves
  event(:fnordstalk_global_cmd_reserve) do
    set_value(:fnordstalk_global_cmd_reserve_minute, data[:value])
    set_value(:fnordstalk_global_cmd_reserve_hour, data[:value])
    set_value(:fnordstalk_global_cmd_reserve_day, data[:value])
  end

  # fnordstalk Gauge for Current Jobs Buried
  gauge :fnordstalk_global_current_jobs_buried_minute, :tick => 60, :title => "Current Jobs Buried (min)"
  gauge :fnordstalk_global_current_jobs_buried_hour, :tick => 1.hour.to_i, :title => "Current Jobs Buried (hr)"
  gauge :fnordstalk_global_current_jobs_buried_day, :tick => 1.day.to_i, :title => "Current Jobs Buried (day)"

  # fnordstalk Event Listener for Current Jobs Buried
  event(:fnordstalk_global_current_jobs_buried) do
    incr :fnordstalk_global_current_jobs_buried_minute, data[:value]
    incr :fnordstalk_global_current_jobs_buried_hour, data[:value]
    incr :fnordstalk_global_current_jobs_buried_day, data[:value]
  end

  # fnordstalk Gauge for Current Workers
  gauge :fnordstalk_global_current_workers_minute, :tick => 60, :title => "Current Workers (min)"
  gauge :fnordstalk_global_current_workers_hour, :tick => 1.hour.to_i, :title => "Current Workers (hr)"
  gauge :fnordstalk_global_current_workers_day, :tick => 1.day.to_i, :title => "Current Workers (day)"

  # fnordstalk Event Listener for Current Workers
  event(:fnordstalk_global_current_workers) do
    incr :fnordstalk_global_current_workers_minute, data[:value]
    incr :fnordstalk_global_current_workers_hour, data[:value]
    incr :fnordstalk_global_current_workers_day, data[:value]
  end

  # fnordstalk Gauge for Global Puts
  gauge :fnordstalk_global_cmd_put_minute, :tick => 60, :title => "Global Puts (min)"
  gauge :fnordstalk_global_cmd_put_hour, :tick => 1.hour.to_i, :title => "Global Puts (hr)"
  gauge :fnordstalk_global_cmd_put_day, :tick => 1.day.to_i, :title => "Global Puts (day)"

  # fnordstalk Event Listener for Global Puts
  event(:fnordstalk_global_cmd_put) do
    set_value(:fnordstalk_global_cmd_put_minute, data[:value])
    set_value(:fnordstalk_global_cmd_put_hour, data[:value])
    set_value(:fnordstalk_global_cmd_put_day, data[:value])
  end

  # fnordstalk Gauge for Global Buries
  gauge :fnordstalk_global_cmd_bury_minute, :tick => 60, :title => "Global Buries (min)"
  gauge :fnordstalk_global_cmd_bury_hour, :tick => 1.hour.to_i, :title => "Global Buries (hr)"
  gauge :fnordstalk_global_cmd_bury_day, :tick => 1.day.to_i, :title => "Global Buries (day)"

  # fnordstalk Event Listener for Global Buries
  event(:fnordstalk_global_cmd_bury) do
    set_value(:fnordstalk_global_cmd_bury_minute, data[:value])
    set_value(:fnordstalk_global_cmd_bury_hour, data[:value])
    set_value(:fnordstalk_global_cmd_bury_day, data[:value])
  end

  # fnordstalk Gauge for Ready
  gauge :fnordstalk_markArticleRead_current_jobs_ready_minute, :tick => 60, :title => "Ready (min)"
  gauge :fnordstalk_markArticleRead_current_jobs_ready_hour, :tick => 1.hour.to_i, :title => "Ready (hr)"
  gauge :fnordstalk_markArticleRead_current_jobs_ready_day, :tick => 1.day.to_i, :title => "Ready (day)"

  # fnordstalk Event Listener for Ready
  event(:fnordstalk_markArticleRead_current_jobs_ready) do
    incr :fnordstalk_markArticleRead_current_jobs_ready_minute, data[:value]
    incr :fnordstalk_markArticleRead_current_jobs_ready_hour, data[:value]
    incr :fnordstalk_markArticleRead_current_jobs_ready_day, data[:value]
  end

  # fnordstalk Gauge for Burried
  gauge :fnordstalk_markArticleRead_current_jobs_buried_minute, :tick => 60, :title => "Burried (min)"
  gauge :fnordstalk_markArticleRead_current_jobs_buried_hour, :tick => 1.hour.to_i, :title => "Burried (hr)"
  gauge :fnordstalk_markArticleRead_current_jobs_buried_day, :tick => 1.day.to_i, :title => "Burried (day)"

  # fnordstalk Event Listener for Burried
  event(:fnordstalk_markArticleRead_current_jobs_buried) do
    incr :fnordstalk_markArticleRead_current_jobs_buried_minute, data[:value]
    incr :fnordstalk_markArticleRead_current_jobs_buried_hour, data[:value]
    incr :fnordstalk_markArticleRead_current_jobs_buried_day, data[:value]
  end

  # fnordstalk Gauge for Using
  gauge :fnordstalk_markArticleRead_current_using_minute, :tick => 60, :title => "Using (min)"
  gauge :fnordstalk_markArticleRead_current_using_hour, :tick => 1.hour.to_i, :title => "Using (hr)"
  gauge :fnordstalk_markArticleRead_current_using_day, :tick => 1.day.to_i, :title => "Using (day)"

  # fnordstalk Event Listener for Using
  event(:fnordstalk_markArticleRead_current_using) do
    incr :fnordstalk_markArticleRead_current_using_minute, data[:value]
    incr :fnordstalk_markArticleRead_current_using_hour, data[:value]
    incr :fnordstalk_markArticleRead_current_using_day, data[:value]
  end

  # fnordstalk Gauge for Total Jobs
  gauge :fnordstalk_markArticleRead_total_jobs_minute, :tick => 60, :title => "Total Jobs (min)"
  gauge :fnordstalk_markArticleRead_total_jobs_hour, :tick => 1.hour.to_i, :title => "Total Jobs (hr)"
  gauge :fnordstalk_markArticleRead_total_jobs_day, :tick => 1.day.to_i, :title => "Total Jobs (day)"

  # fnordstalk Event Listener for Total Jobs
  event(:fnordstalk_markArticleRead_total_jobs) do
    set_value(:fnordstalk_markArticleRead_total_jobs_minute, data[:value])
    set_value(:fnordstalk_markArticleRead_total_jobs_hour, data[:value])
    set_value(:fnordstalk_markArticleRead_total_jobs_day, data[:value])
  end

  # fnordstalk Gauge for Watchers
  gauge :fnordstalk_markArticleRead_current_watching_minute, :tick => 60, :title => "Watchers (min)"
  gauge :fnordstalk_markArticleRead_current_watching_hour, :tick => 1.hour.to_i, :title => "Watchers (hr)"
  gauge :fnordstalk_markArticleRead_current_watching_day, :tick => 1.day.to_i, :title => "Watchers (day)"

  # fnordstalk Event Listener for Watchers
  event(:fnordstalk_markArticleRead_current_watching) do
    incr :fnordstalk_markArticleRead_current_watching_minute, data[:value]
    incr :fnordstalk_markArticleRead_current_watching_hour, data[:value]
    incr :fnordstalk_markArticleRead_current_watching_day, data[:value]
  end

  # fnordstalk Gauge for Ready
  gauge :fnordstalk_recommendArticle_current_jobs_ready_minute, :tick => 60, :title => "Ready (min)"
  gauge :fnordstalk_recommendArticle_current_jobs_ready_hour, :tick => 1.hour.to_i, :title => "Ready (hr)"
  gauge :fnordstalk_recommendArticle_current_jobs_ready_day, :tick => 1.day.to_i, :title => "Ready (day)"

  # fnordstalk Event Listener for Ready
  event(:fnordstalk_recommendArticle_current_jobs_ready) do
    incr :fnordstalk_recommendArticle_current_jobs_ready_minute, data[:value]
    incr :fnordstalk_recommendArticle_current_jobs_ready_hour, data[:value]
    incr :fnordstalk_recommendArticle_current_jobs_ready_day, data[:value]
  end

  # fnordstalk Gauge for Burried
  gauge :fnordstalk_recommendArticle_current_jobs_buried_minute, :tick => 60, :title => "Burried (min)"
  gauge :fnordstalk_recommendArticle_current_jobs_buried_hour, :tick => 1.hour.to_i, :title => "Burried (hr)"
  gauge :fnordstalk_recommendArticle_current_jobs_buried_day, :tick => 1.day.to_i, :title => "Burried (day)"

  # fnordstalk Event Listener for Burried
  event(:fnordstalk_recommendArticle_current_jobs_buried) do
    incr :fnordstalk_recommendArticle_current_jobs_buried_minute, data[:value]
    incr :fnordstalk_recommendArticle_current_jobs_buried_hour, data[:value]
    incr :fnordstalk_recommendArticle_current_jobs_buried_day, data[:value]
  end

  # fnordstalk Gauge for Using
  gauge :fnordstalk_recommendArticle_current_using_minute, :tick => 60, :title => "Using (min)"
  gauge :fnordstalk_recommendArticle_current_using_hour, :tick => 1.hour.to_i, :title => "Using (hr)"
  gauge :fnordstalk_recommendArticle_current_using_day, :tick => 1.day.to_i, :title => "Using (day)"

  # fnordstalk Event Listener for Using
  event(:fnordstalk_recommendArticle_current_using) do
    incr :fnordstalk_recommendArticle_current_using_minute, data[:value]
    incr :fnordstalk_recommendArticle_current_using_hour, data[:value]
    incr :fnordstalk_recommendArticle_current_using_day, data[:value]
  end

  # fnordstalk Gauge for Total Jobs
  gauge :fnordstalk_recommendArticle_total_jobs_minute, :tick => 60, :title => "Total Jobs (min)"
  gauge :fnordstalk_recommendArticle_total_jobs_hour, :tick => 1.hour.to_i, :title => "Total Jobs (hr)"
  gauge :fnordstalk_recommendArticle_total_jobs_day, :tick => 1.day.to_i, :title => "Total Jobs (day)"

  # fnordstalk Event Listener for Total Jobs
  event(:fnordstalk_recommendArticle_total_jobs) do
    set_value(:fnordstalk_recommendArticle_total_jobs_minute, data[:value])
    set_value(:fnordstalk_recommendArticle_total_jobs_hour, data[:value])
    set_value(:fnordstalk_recommendArticle_total_jobs_day, data[:value])
  end

  # fnordstalk Gauge for Watchers
  gauge :fnordstalk_recommendArticle_current_watching_minute, :tick => 60, :title => "Watchers (min)"
  gauge :fnordstalk_recommendArticle_current_watching_hour, :tick => 1.hour.to_i, :title => "Watchers (hr)"
  gauge :fnordstalk_recommendArticle_current_watching_day, :tick => 1.day.to_i, :title => "Watchers (day)"

  # fnordstalk Event Listener for Watchers
  event(:fnordstalk_recommendArticle_current_watching) do
    incr :fnordstalk_recommendArticle_current_watching_minute, data[:value]
    incr :fnordstalk_recommendArticle_current_watching_hour, data[:value]
    incr :fnordstalk_recommendArticle_current_watching_day, data[:value]
  end

  # fnordstalk Gauge for Ready
  gauge :fnordstalk_cleanArticle_current_jobs_ready_minute, :tick => 60, :title => "Ready (min)"
  gauge :fnordstalk_cleanArticle_current_jobs_ready_hour, :tick => 1.hour.to_i, :title => "Ready (hr)"
  gauge :fnordstalk_cleanArticle_current_jobs_ready_day, :tick => 1.day.to_i, :title => "Ready (day)"

  # fnordstalk Event Listener for Ready
  event(:fnordstalk_cleanArticle_current_jobs_ready) do
    incr :fnordstalk_cleanArticle_current_jobs_ready_minute, data[:value]
    incr :fnordstalk_cleanArticle_current_jobs_ready_hour, data[:value]
    incr :fnordstalk_cleanArticle_current_jobs_ready_day, data[:value]
  end

  # fnordstalk Gauge for Burried
  gauge :fnordstalk_cleanArticle_current_jobs_buried_minute, :tick => 60, :title => "Burried (min)"
  gauge :fnordstalk_cleanArticle_current_jobs_buried_hour, :tick => 1.hour.to_i, :title => "Burried (hr)"
  gauge :fnordstalk_cleanArticle_current_jobs_buried_day, :tick => 1.day.to_i, :title => "Burried (day)"

  # fnordstalk Event Listener for Burried
  event(:fnordstalk_cleanArticle_current_jobs_buried) do
    incr :fnordstalk_cleanArticle_current_jobs_buried_minute, data[:value]
    incr :fnordstalk_cleanArticle_current_jobs_buried_hour, data[:value]
    incr :fnordstalk_cleanArticle_current_jobs_buried_day, data[:value]
  end

  # fnordstalk Gauge for Using
  gauge :fnordstalk_cleanArticle_current_using_minute, :tick => 60, :title => "Using (min)"
  gauge :fnordstalk_cleanArticle_current_using_hour, :tick => 1.hour.to_i, :title => "Using (hr)"
  gauge :fnordstalk_cleanArticle_current_using_day, :tick => 1.day.to_i, :title => "Using (day)"

  # fnordstalk Event Listener for Using
  event(:fnordstalk_cleanArticle_current_using) do
    incr :fnordstalk_cleanArticle_current_using_minute, data[:value]
    incr :fnordstalk_cleanArticle_current_using_hour, data[:value]
    incr :fnordstalk_cleanArticle_current_using_day, data[:value]
  end

  # fnordstalk Gauge for Total Jobs
  gauge :fnordstalk_cleanArticle_total_jobs_minute, :tick => 60, :title => "Total Jobs (min)"
  gauge :fnordstalk_cleanArticle_total_jobs_hour, :tick => 1.hour.to_i, :title => "Total Jobs (hr)"
  gauge :fnordstalk_cleanArticle_total_jobs_day, :tick => 1.day.to_i, :title => "Total Jobs (day)"

  # fnordstalk Event Listener for Total Jobs
  event(:fnordstalk_cleanArticle_total_jobs) do
    set_value(:fnordstalk_cleanArticle_total_jobs_minute, data[:value])
    set_value(:fnordstalk_cleanArticle_total_jobs_hour, data[:value])
    set_value(:fnordstalk_cleanArticle_total_jobs_day, data[:value])
  end

  # fnordstalk Gauge for Watchers
  gauge :fnordstalk_cleanArticle_current_watching_minute, :tick => 60, :title => "Watchers (min)"
  gauge :fnordstalk_cleanArticle_current_watching_hour, :tick => 1.hour.to_i, :title => "Watchers (hr)"
  gauge :fnordstalk_cleanArticle_current_watching_day, :tick => 1.day.to_i, :title => "Watchers (day)"

  # fnordstalk Event Listener for Watchers
  event(:fnordstalk_cleanArticle_current_watching) do
    incr :fnordstalk_cleanArticle_current_watching_minute, data[:value]
    incr :fnordstalk_cleanArticle_current_watching_hour, data[:value]
    incr :fnordstalk_cleanArticle_current_watching_day, data[:value]
  end

  # fnordstalk Gauge for Ready
  gauge :fnordstalk_regenerateModels_current_jobs_ready_minute, :tick => 60, :title => "Ready (min)"
  gauge :fnordstalk_regenerateModels_current_jobs_ready_hour, :tick => 1.hour.to_i, :title => "Ready (hr)"
  gauge :fnordstalk_regenerateModels_current_jobs_ready_day, :tick => 1.day.to_i, :title => "Ready (day)"

  # fnordstalk Event Listener for Ready
  event(:fnordstalk_regenerateModels_current_jobs_ready) do
    incr :fnordstalk_regenerateModels_current_jobs_ready_minute, data[:value]
    incr :fnordstalk_regenerateModels_current_jobs_ready_hour, data[:value]
    incr :fnordstalk_regenerateModels_current_jobs_ready_day, data[:value]
  end

  # fnordstalk Gauge for Burried
  gauge :fnordstalk_regenerateModels_current_jobs_buried_minute, :tick => 60, :title => "Burried (min)"
  gauge :fnordstalk_regenerateModels_current_jobs_buried_hour, :tick => 1.hour.to_i, :title => "Burried (hr)"
  gauge :fnordstalk_regenerateModels_current_jobs_buried_day, :tick => 1.day.to_i, :title => "Burried (day)"

  # fnordstalk Event Listener for Burried
  event(:fnordstalk_regenerateModels_current_jobs_buried) do
    incr :fnordstalk_regenerateModels_current_jobs_buried_minute, data[:value]
    incr :fnordstalk_regenerateModels_current_jobs_buried_hour, data[:value]
    incr :fnordstalk_regenerateModels_current_jobs_buried_day, data[:value]
  end

  # fnordstalk Gauge for Using
  gauge :fnordstalk_regenerateModels_current_using_minute, :tick => 60, :title => "Using (min)"
  gauge :fnordstalk_regenerateModels_current_using_hour, :tick => 1.hour.to_i, :title => "Using (hr)"
  gauge :fnordstalk_regenerateModels_current_using_day, :tick => 1.day.to_i, :title => "Using (day)"

  # fnordstalk Event Listener for Using
  event(:fnordstalk_regenerateModels_current_using) do
    incr :fnordstalk_regenerateModels_current_using_minute, data[:value]
    incr :fnordstalk_regenerateModels_current_using_hour, data[:value]
    incr :fnordstalk_regenerateModels_current_using_day, data[:value]
  end

  # fnordstalk Gauge for Total Jobs
  gauge :fnordstalk_regenerateModels_total_jobs_minute, :tick => 60, :title => "Total Jobs (min)"
  gauge :fnordstalk_regenerateModels_total_jobs_hour, :tick => 1.hour.to_i, :title => "Total Jobs (hr)"
  gauge :fnordstalk_regenerateModels_total_jobs_day, :tick => 1.day.to_i, :title => "Total Jobs (day)"

  # fnordstalk Event Listener for Total Jobs
  event(:fnordstalk_regenerateModels_total_jobs) do
    set_value(:fnordstalk_regenerateModels_total_jobs_minute, data[:value])
    set_value(:fnordstalk_regenerateModels_total_jobs_hour, data[:value])
    set_value(:fnordstalk_regenerateModels_total_jobs_day, data[:value])
  end

  # fnordstalk Gauge for Watchers
  gauge :fnordstalk_regenerateModels_current_watching_minute, :tick => 60, :title => "Watchers (min)"
  gauge :fnordstalk_regenerateModels_current_watching_hour, :tick => 1.hour.to_i, :title => "Watchers (hr)"
  gauge :fnordstalk_regenerateModels_current_watching_day, :tick => 1.day.to_i, :title => "Watchers (day)"

  # fnordstalk Event Listener for Watchers
  event(:fnordstalk_regenerateModels_current_watching) do
    incr :fnordstalk_regenerateModels_current_watching_minute, data[:value]
    incr :fnordstalk_regenerateModels_current_watching_hour, data[:value]
    incr :fnordstalk_regenerateModels_current_watching_day, data[:value]
  end

  # fnordstalk Gauge for Ready
  gauge :fnordstalk_addFeed_current_jobs_ready_minute, :tick => 60, :title => "Ready (min)"
  gauge :fnordstalk_addFeed_current_jobs_ready_hour, :tick => 1.hour.to_i, :title => "Ready (hr)"
  gauge :fnordstalk_addFeed_current_jobs_ready_day, :tick => 1.day.to_i, :title => "Ready (day)"

  # fnordstalk Event Listener for Ready
  event(:fnordstalk_addFeed_current_jobs_ready) do
    incr :fnordstalk_addFeed_current_jobs_ready_minute, data[:value]
    incr :fnordstalk_addFeed_current_jobs_ready_hour, data[:value]
    incr :fnordstalk_addFeed_current_jobs_ready_day, data[:value]
  end

  # fnordstalk Gauge for Burried
  gauge :fnordstalk_addFeed_current_jobs_buried_minute, :tick => 60, :title => "Burried (min)"
  gauge :fnordstalk_addFeed_current_jobs_buried_hour, :tick => 1.hour.to_i, :title => "Burried (hr)"
  gauge :fnordstalk_addFeed_current_jobs_buried_day, :tick => 1.day.to_i, :title => "Burried (day)"

  # fnordstalk Event Listener for Burried
  event(:fnordstalk_addFeed_current_jobs_buried) do
    incr :fnordstalk_addFeed_current_jobs_buried_minute, data[:value]
    incr :fnordstalk_addFeed_current_jobs_buried_hour, data[:value]
    incr :fnordstalk_addFeed_current_jobs_buried_day, data[:value]
  end

  # fnordstalk Gauge for Using
  gauge :fnordstalk_addFeed_current_using_minute, :tick => 60, :title => "Using (min)"
  gauge :fnordstalk_addFeed_current_using_hour, :tick => 1.hour.to_i, :title => "Using (hr)"
  gauge :fnordstalk_addFeed_current_using_day, :tick => 1.day.to_i, :title => "Using (day)"

  # fnordstalk Event Listener for Using
  event(:fnordstalk_addFeed_current_using) do
    incr :fnordstalk_addFeed_current_using_minute, data[:value]
    incr :fnordstalk_addFeed_current_using_hour, data[:value]
    incr :fnordstalk_addFeed_current_using_day, data[:value]
  end

  # fnordstalk Gauge for Total Jobs
  gauge :fnordstalk_addFeed_total_jobs_minute, :tick => 60, :title => "Total Jobs (min)"
  gauge :fnordstalk_addFeed_total_jobs_hour, :tick => 1.hour.to_i, :title => "Total Jobs (hr)"
  gauge :fnordstalk_addFeed_total_jobs_day, :tick => 1.day.to_i, :title => "Total Jobs (day)"

  # fnordstalk Event Listener for Total Jobs
  event(:fnordstalk_addFeed_total_jobs) do
    set_value(:fnordstalk_addFeed_total_jobs_minute, data[:value])
    set_value(:fnordstalk_addFeed_total_jobs_hour, data[:value])
    set_value(:fnordstalk_addFeed_total_jobs_day, data[:value])
  end

  # fnordstalk Gauge for Watchers
  gauge :fnordstalk_addFeed_current_watching_minute, :tick => 60, :title => "Watchers (min)"
  gauge :fnordstalk_addFeed_current_watching_hour, :tick => 1.hour.to_i, :title => "Watchers (hr)"
  gauge :fnordstalk_addFeed_current_watching_day, :tick => 1.day.to_i, :title => "Watchers (day)"

  # fnordstalk Event Listener for Watchers
  event(:fnordstalk_addFeed_current_watching) do
    incr :fnordstalk_addFeed_current_watching_minute, data[:value]
    incr :fnordstalk_addFeed_current_watching_hour, data[:value]
    incr :fnordstalk_addFeed_current_watching_day, data[:value]
  end

  # fnordstalk Gauge for Ready
  gauge :fnordstalk_updateFeed_current_jobs_ready_minute, :tick => 60, :title => "Ready (min)"
  gauge :fnordstalk_updateFeed_current_jobs_ready_hour, :tick => 1.hour.to_i, :title => "Ready (hr)"
  gauge :fnordstalk_updateFeed_current_jobs_ready_day, :tick => 1.day.to_i, :title => "Ready (day)"

  # fnordstalk Event Listener for Ready
  event(:fnordstalk_updateFeed_current_jobs_ready) do
    incr :fnordstalk_updateFeed_current_jobs_ready_minute, data[:value]
    incr :fnordstalk_updateFeed_current_jobs_ready_hour, data[:value]
    incr :fnordstalk_updateFeed_current_jobs_ready_day, data[:value]
  end

  # fnordstalk Gauge for Burried
  gauge :fnordstalk_updateFeed_current_jobs_buried_minute, :tick => 60, :title => "Burried (min)"
  gauge :fnordstalk_updateFeed_current_jobs_buried_hour, :tick => 1.hour.to_i, :title => "Burried (hr)"
  gauge :fnordstalk_updateFeed_current_jobs_buried_day, :tick => 1.day.to_i, :title => "Burried (day)"

  # fnordstalk Event Listener for Burried
  event(:fnordstalk_updateFeed_current_jobs_buried) do
    incr :fnordstalk_updateFeed_current_jobs_buried_minute, data[:value]
    incr :fnordstalk_updateFeed_current_jobs_buried_hour, data[:value]
    incr :fnordstalk_updateFeed_current_jobs_buried_day, data[:value]
  end

  # fnordstalk Gauge for Using
  gauge :fnordstalk_updateFeed_current_using_minute, :tick => 60, :title => "Using (min)"
  gauge :fnordstalk_updateFeed_current_using_hour, :tick => 1.hour.to_i, :title => "Using (hr)"
  gauge :fnordstalk_updateFeed_current_using_day, :tick => 1.day.to_i, :title => "Using (day)"

  # fnordstalk Event Listener for Using
  event(:fnordstalk_updateFeed_current_using) do
    incr :fnordstalk_updateFeed_current_using_minute, data[:value]
    incr :fnordstalk_updateFeed_current_using_hour, data[:value]
    incr :fnordstalk_updateFeed_current_using_day, data[:value]
  end

  # fnordstalk Gauge for Total Jobs
  gauge :fnordstalk_updateFeed_total_jobs_minute, :tick => 60, :title => "Total Jobs (min)"
  gauge :fnordstalk_updateFeed_total_jobs_hour, :tick => 1.hour.to_i, :title => "Total Jobs (hr)"
  gauge :fnordstalk_updateFeed_total_jobs_day, :tick => 1.day.to_i, :title => "Total Jobs (day)"

  # fnordstalk Event Listener for Total Jobs
  event(:fnordstalk_updateFeed_total_jobs) do
    set_value(:fnordstalk_updateFeed_total_jobs_minute, data[:value])
    set_value(:fnordstalk_updateFeed_total_jobs_hour, data[:value])
    set_value(:fnordstalk_updateFeed_total_jobs_day, data[:value])
  end

  # fnordstalk Gauge for Watchers
  gauge :fnordstalk_updateFeed_current_watching_minute, :tick => 60, :title => "Watchers (min)"
  gauge :fnordstalk_updateFeed_current_watching_hour, :tick => 1.hour.to_i, :title => "Watchers (hr)"
  gauge :fnordstalk_updateFeed_current_watching_day, :tick => 1.day.to_i, :title => "Watchers (day)"

  # fnordstalk Event Listener for Watchers
  event(:fnordstalk_updateFeed_current_watching) do
    incr :fnordstalk_updateFeed_current_watching_minute, data[:value]
    incr :fnordstalk_updateFeed_current_watching_hour, data[:value]
    incr :fnordstalk_updateFeed_current_watching_day, data[:value]
  end

  # fnordstalk Gauge for Ready
  gauge :fnordstalk_updateUserFeeds_current_jobs_ready_minute, :tick => 60, :title => "Ready (min)"
  gauge :fnordstalk_updateUserFeeds_current_jobs_ready_hour, :tick => 1.hour.to_i, :title => "Ready (hr)"
  gauge :fnordstalk_updateUserFeeds_current_jobs_ready_day, :tick => 1.day.to_i, :title => "Ready (day)"

  # fnordstalk Event Listener for Ready
  event(:fnordstalk_updateUserFeeds_current_jobs_ready) do
    incr :fnordstalk_updateUserFeeds_current_jobs_ready_minute, data[:value]
    incr :fnordstalk_updateUserFeeds_current_jobs_ready_hour, data[:value]
    incr :fnordstalk_updateUserFeeds_current_jobs_ready_day, data[:value]
  end

  # fnordstalk Gauge for Burried
  gauge :fnordstalk_updateUserFeeds_current_jobs_buried_minute, :tick => 60, :title => "Burried (min)"
  gauge :fnordstalk_updateUserFeeds_current_jobs_buried_hour, :tick => 1.hour.to_i, :title => "Burried (hr)"
  gauge :fnordstalk_updateUserFeeds_current_jobs_buried_day, :tick => 1.day.to_i, :title => "Burried (day)"

  # fnordstalk Event Listener for Burried
  event(:fnordstalk_updateUserFeeds_current_jobs_buried) do
    incr :fnordstalk_updateUserFeeds_current_jobs_buried_minute, data[:value]
    incr :fnordstalk_updateUserFeeds_current_jobs_buried_hour, data[:value]
    incr :fnordstalk_updateUserFeeds_current_jobs_buried_day, data[:value]
  end

  # fnordstalk Gauge for Using
  gauge :fnordstalk_updateUserFeeds_current_using_minute, :tick => 60, :title => "Using (min)"
  gauge :fnordstalk_updateUserFeeds_current_using_hour, :tick => 1.hour.to_i, :title => "Using (hr)"
  gauge :fnordstalk_updateUserFeeds_current_using_day, :tick => 1.day.to_i, :title => "Using (day)"

  # fnordstalk Event Listener for Using
  event(:fnordstalk_updateUserFeeds_current_using) do
    incr :fnordstalk_updateUserFeeds_current_using_minute, data[:value]
    incr :fnordstalk_updateUserFeeds_current_using_hour, data[:value]
    incr :fnordstalk_updateUserFeeds_current_using_day, data[:value]
  end

  # fnordstalk Gauge for Total Jobs
  gauge :fnordstalk_updateUserFeeds_total_jobs_minute, :tick => 60, :title => "Total Jobs (min)"
  gauge :fnordstalk_updateUserFeeds_total_jobs_hour, :tick => 1.hour.to_i, :title => "Total Jobs (hr)"
  gauge :fnordstalk_updateUserFeeds_total_jobs_day, :tick => 1.day.to_i, :title => "Total Jobs (day)"

  # fnordstalk Event Listener for Total Jobs
  event(:fnordstalk_updateUserFeeds_total_jobs) do
    set_value(:fnordstalk_updateUserFeeds_total_jobs_minute, data[:value])
    set_value(:fnordstalk_updateUserFeeds_total_jobs_hour, data[:value])
    set_value(:fnordstalk_updateUserFeeds_total_jobs_day, data[:value])
  end

  # fnordstalk Gauge for Watchers
  gauge :fnordstalk_updateUserFeeds_current_watching_minute, :tick => 60, :title => "Watchers (min)"
  gauge :fnordstalk_updateUserFeeds_current_watching_hour, :tick => 1.hour.to_i, :title => "Watchers (hr)"
  gauge :fnordstalk_updateUserFeeds_current_watching_day, :tick => 1.day.to_i, :title => "Watchers (day)"

  # fnordstalk Event Listener for Watchers
  event(:fnordstalk_updateUserFeeds_current_watching) do
    incr :fnordstalk_updateUserFeeds_current_watching_minute, data[:value]
    incr :fnordstalk_updateUserFeeds_current_watching_hour, data[:value]
    incr :fnordstalk_updateUserFeeds_current_watching_day, data[:value]
  end

  # fnordstalk Gauge for Ready
  gauge :fnordstalk_notifySubscribers_current_jobs_ready_minute, :tick => 60, :title => "Ready (min)"
  gauge :fnordstalk_notifySubscribers_current_jobs_ready_hour, :tick => 1.hour.to_i, :title => "Ready (hr)"
  gauge :fnordstalk_notifySubscribers_current_jobs_ready_day, :tick => 1.day.to_i, :title => "Ready (day)"

  # fnordstalk Event Listener for Ready
  event(:fnordstalk_notifySubscribers_current_jobs_ready) do
    incr :fnordstalk_notifySubscribers_current_jobs_ready_minute, data[:value]
    incr :fnordstalk_notifySubscribers_current_jobs_ready_hour, data[:value]
    incr :fnordstalk_notifySubscribers_current_jobs_ready_day, data[:value]
  end

  # fnordstalk Gauge for Burried
  gauge :fnordstalk_notifySubscribers_current_jobs_buried_minute, :tick => 60, :title => "Burried (min)"
  gauge :fnordstalk_notifySubscribers_current_jobs_buried_hour, :tick => 1.hour.to_i, :title => "Burried (hr)"
  gauge :fnordstalk_notifySubscribers_current_jobs_buried_day, :tick => 1.day.to_i, :title => "Burried (day)"

  # fnordstalk Event Listener for Burried
  event(:fnordstalk_notifySubscribers_current_jobs_buried) do
    incr :fnordstalk_notifySubscribers_current_jobs_buried_minute, data[:value]
    incr :fnordstalk_notifySubscribers_current_jobs_buried_hour, data[:value]
    incr :fnordstalk_notifySubscribers_current_jobs_buried_day, data[:value]
  end

  # fnordstalk Gauge for Using
  gauge :fnordstalk_notifySubscribers_current_using_minute, :tick => 60, :title => "Using (min)"
  gauge :fnordstalk_notifySubscribers_current_using_hour, :tick => 1.hour.to_i, :title => "Using (hr)"
  gauge :fnordstalk_notifySubscribers_current_using_day, :tick => 1.day.to_i, :title => "Using (day)"

  # fnordstalk Event Listener for Using
  event(:fnordstalk_notifySubscribers_current_using) do
    incr :fnordstalk_notifySubscribers_current_using_minute, data[:value]
    incr :fnordstalk_notifySubscribers_current_using_hour, data[:value]
    incr :fnordstalk_notifySubscribers_current_using_day, data[:value]
  end

  # fnordstalk Gauge for Total Jobs
  gauge :fnordstalk_notifySubscribers_total_jobs_minute, :tick => 60, :title => "Total Jobs (min)"
  gauge :fnordstalk_notifySubscribers_total_jobs_hour, :tick => 1.hour.to_i, :title => "Total Jobs (hr)"
  gauge :fnordstalk_notifySubscribers_total_jobs_day, :tick => 1.day.to_i, :title => "Total Jobs (day)"

  # fnordstalk Event Listener for Total Jobs
  event(:fnordstalk_notifySubscribers_total_jobs) do
    set_value(:fnordstalk_notifySubscribers_total_jobs_minute, data[:value])
    set_value(:fnordstalk_notifySubscribers_total_jobs_hour, data[:value])
    set_value(:fnordstalk_notifySubscribers_total_jobs_day, data[:value])
  end

  # fnordstalk Gauge for Watchers
  gauge :fnordstalk_notifySubscribers_current_watching_minute, :tick => 60, :title => "Watchers (min)"
  gauge :fnordstalk_notifySubscribers_current_watching_hour, :tick => 1.hour.to_i, :title => "Watchers (hr)"
  gauge :fnordstalk_notifySubscribers_current_watching_day, :tick => 1.day.to_i, :title => "Watchers (day)"

  # fnordstalk Event Listener for Watchers
  event(:fnordstalk_notifySubscribers_current_watching) do
    incr :fnordstalk_notifySubscribers_current_watching_minute, data[:value]
    incr :fnordstalk_notifySubscribers_current_watching_hour, data[:value]
    incr :fnordstalk_notifySubscribers_current_watching_day, data[:value]
  end

  # Widget for Commands
  widget "Beanstalk", {
    :title => "Commands",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_global_cmd_bury_minute, :fnordstalk_global_cmd_put_minute, :fnordstalk_global_cmd_reserve_minute],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for Users
  widget "Beanstalk", {
    :title => "Users",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_global_current_jobs_ready_minute, :fnordstalk_global_current_jobs_buried_minute],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for Jobs
  widget "Beanstalk", {
    :title => "Jobs",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_global_total_jobs_hour],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for markArticleRead - Jobs
  widget "Beanstalk", {
    :title => "markArticleRead - Jobs",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_markArticleRead_current_jobs_ready_minute, :fnordstalk_markArticleRead_current_jobs_buried_minute],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for markArticleRead - Users
  widget "Beanstalk", {
    :title => "markArticleRead - Users",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_markArticleRead_current_watching_hour, :fnordstalk_markArticleRead_current_using_hour],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for markArticleRead - Jobs Total
  widget "Beanstalk", {
    :title => "markArticleRead - Jobs Total",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_markArticleRead_total_jobs_hour],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for recommendArticle - Jobs
  widget "Beanstalk", {
    :title => "recommendArticle - Jobs",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_recommendArticle_current_jobs_ready_minute, :fnordstalk_recommendArticle_current_jobs_buried_minute],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for recommendArticle - Users
  widget "Beanstalk", {
    :title => "recommendArticle - Users",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_recommendArticle_current_watching_hour, :fnordstalk_recommendArticle_current_using_hour],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for recommendArticle - Jobs Total
  widget "Beanstalk", {
    :title => "recommendArticle - Jobs Total",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_recommendArticle_total_jobs_hour],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for cleanArticle - Jobs
  widget "Beanstalk", {
    :title => "cleanArticle - Jobs",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_cleanArticle_current_jobs_ready_minute, :fnordstalk_cleanArticle_current_jobs_buried_minute],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for cleanArticle - Users
  widget "Beanstalk", {
    :title => "cleanArticle - Users",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_cleanArticle_current_watching_hour, :fnordstalk_cleanArticle_current_using_hour],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for cleanArticle - Jobs Total
  widget "Beanstalk", {
    :title => "cleanArticle - Jobs Total",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_cleanArticle_total_jobs_hour],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for regenerateModels - Jobs
  widget "Beanstalk", {
    :title => "regenerateModels - Jobs",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_regenerateModels_current_jobs_ready_minute, :fnordstalk_regenerateModels_current_jobs_buried_minute],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for regenerateModels - Users
  widget "Beanstalk", {
    :title => "regenerateModels - Users",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_regenerateModels_current_watching_hour, :fnordstalk_regenerateModels_current_using_hour],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for regenerateModels - Jobs Total
  widget "Beanstalk", {
    :title => "regenerateModels - Jobs Total",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_regenerateModels_total_jobs_hour],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for addFeed - Jobs
  widget "Beanstalk", {
    :title => "addFeed - Jobs",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_addFeed_current_jobs_ready_minute, :fnordstalk_addFeed_current_jobs_buried_minute],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for addFeed - Users
  widget "Beanstalk", {
    :title => "addFeed - Users",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_addFeed_current_watching_hour, :fnordstalk_addFeed_current_using_hour],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for addFeed - Jobs Total
  widget "Beanstalk", {
    :title => "addFeed - Jobs Total",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_addFeed_total_jobs_hour],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for updateFeed - Jobs
  widget "Beanstalk", {
    :title => "updateFeed - Jobs",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_updateFeed_current_jobs_ready_minute, :fnordstalk_updateFeed_current_jobs_buried_minute],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for updateFeed - Users
  widget "Beanstalk", {
    :title => "updateFeed - Users",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_updateFeed_current_watching_hour, :fnordstalk_updateFeed_current_using_hour],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for updateFeed - Jobs Total
  widget "Beanstalk", {
    :title => "updateFeed - Jobs Total",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_updateFeed_total_jobs_hour],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for updateUserFeeds - Jobs
  widget "Beanstalk", {
    :title => "updateUserFeeds - Jobs",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_updateUserFeeds_current_jobs_ready_minute, :fnordstalk_updateUserFeeds_current_jobs_buried_minute],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for updateUserFeeds - Users
  widget "Beanstalk", {
    :title => "updateUserFeeds - Users",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_updateUserFeeds_current_watching_hour, :fnordstalk_updateUserFeeds_current_using_hour],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for updateUserFeeds - Jobs Total
  widget "Beanstalk", {
    :title => "updateUserFeeds - Jobs Total",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_updateUserFeeds_total_jobs_hour],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for notifySubscribers - Jobs
  widget "Beanstalk", {
    :title => "notifySubscribers - Jobs",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_notifySubscribers_current_jobs_ready_minute, :fnordstalk_notifySubscribers_current_jobs_buried_minute],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for notifySubscribers - Users
  widget "Beanstalk", {
    :title => "notifySubscribers - Users",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_notifySubscribers_current_watching_hour, :fnordstalk_notifySubscribers_current_using_hour],
    :include_current => true,
    :autoupdate => 60
  }

  # Widget for notifySubscribers - Jobs Total
  widget "Beanstalk", {
    :title => "notifySubscribers - Jobs Total",
    :type => :timeline,
    :width => 50,
    :gauges => [:fnordstalk_notifySubscribers_total_jobs_hour],
    :include_current => true,
    :autoupdate => 60
  }
end

FnordMetric.server_configuration = {
  :redis_url => "redis://localhost:6379",
  :redis_prefix => "fnordmetric",
  :inbound_stream => ["0.0.0.0", "1339"],
  :start_worker => true,
  :print_stats => 3,

  # events that aren't processed after 2 min get dropped
  :event_queue_ttl => 120,

  # event data is kept for one month
  :event_data_ttl => 3600*24*30,

  # session data is kept for one month
  :session_data_ttl => 3600*24*30
}

FnordMetric.standalone