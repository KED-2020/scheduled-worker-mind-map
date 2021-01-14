# frozen_string_literal: true

require_relative '../../init.rb'
require 'aws-sdk-sqs'

module MindMap
  # Scheduled worker to report on recent cloning operations
  class ScheduledWorker
    def initialize
      @config = ScheduledWorker.config
      @queue = MindMap::Messaging::Queue.new(
        @config.SCHEDULED_QUEUE_URL, @config
      )

      puts "Queue Name = #{@config.SCHEDULED_QUEUE}"
    end

    def call
      puts "REPORT DateTime: #{Time.now}"

      @queue.poll do |message|
        puts message
      end
    end

  end
end
