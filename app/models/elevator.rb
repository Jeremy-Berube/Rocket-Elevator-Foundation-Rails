# require './lib/tasks/send_sms.rb'
require 'twilio-ruby'

class Elevator < ApplicationRecord
    belongs_to :column
    after_update :send_sms

    #Call method 'message' when an elevator status changes to 'intervention'
    def send_sms
        status = self.status
        if status.upcase == 'INTERVENTION'
           self.message
        end
    end

    #Send a Message to Elevators maintenance guy
    def message
        account_sid = ENV['TWILIO_ACCOUNT_SID'] 
        auth_token = ENV['TWILIO_AUTH_TOKEN'] 
        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = '+18198030185'
        # from = ENV['TWILIO_PHONE_NUMBER']
        to = '+18195311787' # Your mobile phone number

        client.messages.create(
        from: from,
        to: to,
        body: "The Elevator '#{self.id}', Serial Number '#{self.serial_number}' needs an intervention" 
        )
    end
end
