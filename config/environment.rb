# frozen_string_literal: true

require 'econfig'

module MindMap
  # Setup config environment
  class ScheduledWorker
    extend Econfig::Shortcut
    Econfig.env = ENV['WORKER_ENV'] || 'test'    # or 'development'
    Econfig.root = File.expand_path('..', File.dirname(__FILE__))
  end
end
