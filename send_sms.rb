# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class Sendsms
        attr_reader :message

        def initialize
            @message = message
        end

        def send_sms
            account_sid = 'ACf22bb57fdf29594ed22217cba26911d5'
            auth_token = '9f54f57ee93e41ad2bf5122fe62e5336'
            client = Twilio::REST::Client.new(account_sid, auth_token)

            from = '+18198030185' # Your Twilio number
            to = '+18195311787' # Your mobile phone number

            client.messages.create(
            from: from,
            to: to,
            body: message 
            )
        end
end