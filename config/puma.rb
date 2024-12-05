# config/puma.rb

workers Integer(ENV["WEB_CONCURRENCY"] || 2)
threads Integer(ENV["RAILS_MAX_THREADS"] || 5), Integer(ENV["RAILS_MAX_THREADS"] || 5)

preload_app!

port        ENV["PORT"]     || 3000
environment ENV["RAILS_ENV"] || "development"

on_worker_boot do
  ActiveRecord::Base.establish_connection
end

# Configure Puma to use a cluster mode
cluster_master true

# Minimum and Maximum number of processes to use
min_threads  5
max_threads  5

# Specifies the number of threads to use to serve requests.
workers 2

# Use the bundled Puma control script for starting and stopping the cluster
daemonize true

# Set the directory where Puma will store its pidfile and state files
pidfile "/path/to/your/app/tmp/pids/puma.pid"
state_path "/path/to/your/app/tmp/pids/puma.state"

# Timeouts
timeout 30
