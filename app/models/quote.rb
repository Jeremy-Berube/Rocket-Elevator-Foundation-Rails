require 'zendesk_api'

class Quote < ApplicationRecord
    after_save :zendesk_quote_ticket

    def zendesk_quote_ticket
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end
        ZendeskAPI::Ticket.create!(client, 
        :subject => "#{self.contact_name.capitalize} from #{self.company_name.capitalize}",
        :comment => {
            :value => "The contact #{self.contact_name.capitalize} from #{self.company_name.capitalize} can be reached at #{self.email}

            The selected product line is #{self.product_line.capitalize} for #{self.building_type.capitalize} building.

            The cost for the #{self.required_shafts} shafts needed is: #{self.sub_total}.

            Installations fees are #{self.installation_fee}
            
            The total cost is  #{self.total}."
        },
        :requester => {
            "name": self.contact_name,
            # "email": self.email
        },
        :priority => "high",
        :type => "task"
        )
    end
end
