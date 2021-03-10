require 'geocoder'

module RailsAdmin
  module Config
    module Actions
      class Map < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :root? do
          true
        end
        
        register_instance_option :breadcrumb_parent do
          nil
        end
        
        register_instance_option :auditing_versions_limit do
          100
        end

        register_instance_option :route_fragment do
          'map.html.erb'
        end

        register_instance_option :link_icon do
          'icon-map-marker'
        end

        register_instance_option :statistics? do
          false
        end


        register_instance_option :controller do
          proc do
            @datas = []
            
            Building.all.each do |building|
              data= {}
              address = [building.address.number_and_street, building.address.city, building.address.postal_code, building.address.country].compact.join(',')
              if Geocoder.search(address).length > 0 
                get_coordinates = Geocoder.search(address)
                
                if get_coordinates.first.coordinates.length > 0 

                  data[:lat] = get_coordinates.first.coordinates[0]
                  data[:lng] = get_coordinates.first.coordinates[1]
                  puts data
                  @datas << data
                end

              $amount_columns = 0
              $amount_elevators = 0

              comment = "<h5><FONT color='#941001'>#{address}</FONT></h5>"			
              comment += "<h6><FONT color='#073254'>#{building.customer.company_name}</FONT></h6>"
              comment += "<b>Number of Batteries:</b> #{building.batteries.count}"

              building.batteries.each do |battery|
                $amount_columns += battery.columns.count      
                battery.columns.each do |column|
                  $amount_elevators += column.elevators.count      
                end
              end
              comment += "<br><b>Number of Columns:</b> #{$amount_columns}"   
              comment += "<br><b>Number of Elevators:</b> #{$amount_elevators}"   
              comment += "<br><b>Technical contact:</b> #{building.full_name_of_the_technical_contact_for_the_building}"
              data[:infowindow] = comment
              @datas.append(data)

              end
            end
          end
        end
        
      end
    end
  end
end