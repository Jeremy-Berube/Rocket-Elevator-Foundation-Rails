require 'rails_helper'

RSpec.describe QuotesController::Quote do 
    describe "Quote" do 
        quote = Quote.create(
            company_name: "testname",
            contact_name: "test",
            email: "test@test.test",
            product_line: "Standard",
            installation_fee: "123",
            sub_total: "234",
            total: "23131",
            building_type: "Commercial",
            num_of_floors: 0,
            num_of_apartments: 0,
            num_of_basements: 0, 
            num_of_parking_spots: 0,
            num_of_distinct_businesses: 0,
            num_of_elevator_cages: 0,
            num_of_occupants_per_Floor: 0,
            num_of_activity_hours_per_day: 0,
            required_columns: 0,
            required_shafts: 0 
        )
        context "New Quote" do           

            it  "Test Quote #1" do 
                expect(quote).to be_a(Quote)
            end

            it "Test Quote #2" do 
                expect(quote).not_to be(nil)
            end

            it "Test Quote #3" do 
                expect(quote.contact_name).to be_a(String)
                expect(quote.company_name).to be_a(String)
                expect(quote.email).to be_a(String)
                expect(quote.product_line).to be_a(String)
                expect(quote.installation_fee).to be_a(String)
                expect(quote.sub_total).to be_a(String)
                expect(quote.total).to be_a(String)
                expect(quote.building_type).to be_a(String)
                expect(quote.num_of_floors).to be_a(Integer)
                expect(quote.num_of_apartments).to be_a(Integer)
                expect(quote.num_of_basements).to be_a(Integer)
                expect(quote.num_of_apartments).to be_a(Integer)
                expect(quote.num_of_parking_spots).to be_a(Integer)
                expect(quote.num_of_distinct_businesses).to be_a(Integer)
                expect(quote.num_of_elevator_cages).to be_a(Integer)
                expect(quote.num_of_occupants_per_Floor).to be_a(Integer)
                expect(quote.num_of_activity_hours_per_day).to be_a(Integer)
                expect(quote.required_columns).to be_a(Integer)
                expect(quote.required_shafts).to be_a(Integer)
            end    
        end
    end


end