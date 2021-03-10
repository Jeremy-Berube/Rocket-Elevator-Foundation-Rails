require 'slack-notifier'

class Elevator < ApplicationRecord
    belongs_to :column
    
    around_update :elevator_status_is_changed
    private
    def elevator_status_is_changed
    notify = self.status_changed?
    if notify
        notifier = Slack::Notifier.new ENV['SLACK_API_TOKEN']
        notifier = Slack::Notifier.new ENV['SLACK_WEBHOOK_URL']
        notifier.ping "The elevator with ID '#{self.id} with serial number '#{self.serial_number} change status from '#{self.status_was} to '#{self.status}" 
    end
    yield
    end
end
