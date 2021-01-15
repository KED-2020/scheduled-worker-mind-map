# frozen_string_literal: true

task :default do
  puts `rake -T`
end

namespace :console do
  desc 'Run application console (irb) in dev env'
  task :dev do
    sh 'irb -r ./init'
  end

  desc 'Run application console (irb) in test env'
  task :test do
    sh 'RACK_ENV=test irb -r ./init'
  end
end

desc 'Run the worker (test or production)'
task :worker do
  env = ENV['WORKER_ENV'] || 'test'
  
  puts "\nRUNNING WORKER WITH LOCAL CONTEXT"
  puts " Running in #{env} mode"

  require_relative './init'
  MindMap::ScheduledWorker.new.call
end
