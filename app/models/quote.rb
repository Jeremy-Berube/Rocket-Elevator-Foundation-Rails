require 'zendesk_api'

class Quote < ApplicationRecord
    after_create :zendesk_quote_ticket

    def zendesk_quote_ticket
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end
        ZendeskAPI::Ticket.create!(client, 
        :subject => "#{self.contact_name} from #{self.company_name}",
        :comment => {
            :value => "The contact #{self.contact_name} from #{self.company_name} can be reached at #{self.email}
            He has choose the #{self.product_line} product line for #{self.building_type} building.
            There will be #{self.num_of_elevator_cages} elevator cages for a total cost of #{self.total} $.
            #{self.id}."
        },
        :requester => {
            "name": self.contact_name,
            "email": self.email
        },
        :priority => "normal",
        :type => "task"
        )
    end
end
