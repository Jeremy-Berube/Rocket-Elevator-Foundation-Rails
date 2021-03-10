class Lead < ApplicationRecord

    # after_save :zendesk_lead_ticket

    # def zendesk_lead_ticket
    #     ZendeskAPI::Ticket.create!($client, 
    #     :subject => "#{self.full_name_of_contact} #{self.company_ name}",
    #     :comment => {
    #         :value => "#{self.full_name_of_contact}
    #         #{self.company_name}
    #         #{self.email}.
    #         #{self.phone}
    #         #{self.department_in_charge_of_elevatorss}
    #         #{self.project_name}
    #         #{self.project_description}
    #         #{self.message}."
    #     },
    #     :requester => {
    #         "name": self.full_name_of_contact,
    #         "email": self.email
    #     },
    #     :priority => "normal",
    #     :type => "question"
    #     )
    # end
end
