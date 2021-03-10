class Quote < ApplicationRecord

    # after_save :zendesk_quote_ticket

    # def zendesk_quote_ticket
    #     ZendeskAPI::Ticket.create!($client, 
    #     :subject => "#{self.contact_name} from #{self.company_name}",
    #     :comment => {
    #         :value => "#{self.contact_name} 
    #         #{self.email}
    #         #{self.phone}
    #         #{self.building_type}
    #         #{self.product_line}
    #         #{self.number_of_elevator_cages}
    #         #{self.total}
    #         #{self.id}."
    #     },
    #     :requester => {
    #         "name": self.name,
    #         "email": self.email
    #     },
    #     :priority => "normal",
    #     :type => "task"
    #     )
    # end
end
