require 'geocoder'
class Address < ApplicationRecord
    has_one :customer
    has_one :building

before_save :get_coordinates
private
    def get_coordinates
        address = [self.number_and_street, self.city, self.postal_code, self.country].compact.join(',')
        if Geocoder.search(address).length > 0 
            coordinates = Geocoder.search(address)
            
              self.latitude = coordinates.first.coordinates[0]
              self.longitude = coordinates.first.coordinates[1]
              puts "lat et lng added"
        end
    end

end
