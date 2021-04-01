require 'rails_helper'

RSpec.describe "Test Route Building", :type => :routing do 
    describe "Get Building" do 

        it "Test Building" do 
            expect(get("update_buildings")).to route_to("intervention#update_buildings")
        end
    end
end