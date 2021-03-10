

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
                address = [building.address.number_and_street, building.address.city, building.address.postal_code, building.address.country, building.address.latitude, building.address.longitude].compact.join(',')

                data[:lat] = building.address.latitude
                data[:lng] = building.address.longitude
                puts data
                @datas << data


                number_columns = 0
                number_elevators = 0


                comment = "<br><b>Address:</b><FONT color='#941001'> #{building.address.number_and_street}</FONT>"
                
                building.building_details.each do |building_detail|
                  if building_detail.information_key == "Number of Floors"
                    comment += "<br><b>Number of Floors:</b> #{building_detail.value}"
                  end
                end

                comment += "<br><b>Company Name:</b><FONT color='#073254'> #{building.customer.company_name}</FONT>"
                comment += "<br><b>Number of Batteries:</b> #{building.batteries.count}"

                building.batteries.each do |battery|
                  number_columns += battery.columns.count      
                  battery.columns.each do |column|
                    number_elevators += column.elevators.count      
                  end
                end
                comment += "<br><b>Number of Columns:</b> #{number_columns}"   
                comment += "<br><b>Number of Elevators:</b> #{number_elevators}"   
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