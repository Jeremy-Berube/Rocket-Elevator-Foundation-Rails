
require 'rails_helper'

RSpec.describe Lead, :type => :model do 
    describe "Lead" do 
        lead = Lead.create(
            full_name_of_contact: "sup",
            company_name: "test",
            email: "test@test.test",
            phone: "123456789",
            project_name: "test123",
            project_description: "I wish this was pokemon",
            department_in_charge_of_elevators: "Sales",
            message: "idk",
            attachment: nil,
            file_name: "filetest"
        )
        context "New Lead" do           

            it  "Test Lead #1" do 
                expect(lead).to be_a(Lead)
            end

            it "Test Lead #2" do 
                expect(lead).not_to be(nil)
            end

            it "Test lead #3" do 
                expect(lead.full_name_of_contact).to be_a(String)
                expect(lead.company_name).to be_a(String)
                expect(lead.email).to be_a(String)
                expect(lead.phone).to be_a(String)
                expect(lead.project_name).to be_a(String)
                expect(lead.project_description).to be_a(String)
                expect(lead.department_in_charge_of_elevators).to be_a(String)
                expect(lead.message).to be_a(String)
                expect(lead.file_name).to be_a(String)
            end    
        end
    end


end