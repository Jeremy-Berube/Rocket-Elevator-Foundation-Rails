class Address < ApplicationRecord
    has_one :customer
    has_one :building
    def update_coord
        puts self.number_and_street
        gmaps = GoogleMapsService::Client.new(key: ENV['GOOGLE_MAPS_API'])
        results = gmaps.geocode(self.number_and_street+","+self.city+","+self.country)
        #puts results[0][:geometry][:location][:lat]
        self.update_attribute(:lat, results[0][:geometry][:location][:lat])
        self.update_attribute(:long, results[0][:geometry][:location][:lng])
    end

end
