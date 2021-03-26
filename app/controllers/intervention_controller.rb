class InterventionController < ApplicationController
    def update_buildings 
        @buildingList = Building.where(customer_id: params[:customer_id])
        render json: {building: @buildingList}
    end
    def update_batteries 
        @batteryList = Battery.where(building_id: params[:building_id])
        render json: {battery: @batteryList}
    end
    def update_columns 
        @columnList = Column.where(battery_id: params[:battery_id])
        render json: {column: @columnList}
    end
    def update_elevators 
        @elevatorList = Elevator.where(column_id: params[:column_id])
        render json: {elevator: @elevatorList}
    end

    def create 
        
        @intervention = Intervention.new
        @intervention.author = current_user.id
        @intervention.report = params[:description]
        @intervention.customer_id = params[:customer_id]
        @intervention.building_id = params[:building_id]

        # @batteryList.each do |b|
        #     puts b
        #     if b.status == 'intervention'
        #         @intervention.batteries_id = params[:battery_id]
        #     end
        # end

        # if @columnList.status == 'Intervention'
        #     @intervention.columns_id = params[:column_id]
        # end

        # if @elevatorList.status == 'Intervention'        
        # @intervention.elevators_id = params[:elevator_id]
        # end 
        @intervention.battery_id = params[:battery_id]
        @intervention.column_id = params[:column_id]
        @intervention.elevator_id = params[:elevator_id]
        @intervention.employee_id = params[:employee_id]
        @intervention.save!

        if @intervention.save! 
            redirect_back fallback_location: intervention_path, notice:"Your intervention was successfully stored"
            zendesk_lead_ticket()
        end
    end
    require 'zendesk_api'

    def zendesk_lead_ticket
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end
        ZendeskAPI::Ticket.create!(client, 
        :subject => "Intervention Needed",
        :comment => {
            :value => 
            "From employee ID:  #{Employee.find_by(user_id: current_user.id).first_name} #{Employee.find_by(user_id: current_user.id).last_name}
            For customer ID: #{Customer.find(params[:customer_id]).company_name}
            Intervention location:\n
            Building: #{params[:building_id]}
            Battery: #{params[:battery_id]}
            Column: #{params[:column_id]}
            Elevator: #{params[:elevator_id]}
            Employee assign: #{params[:employee_id]}\n\n
            Projet Description : #{params[:description]}"
        },
        :requester => client.current_user.id,
        :priority => "urgent",
        :type => "task"
        )
    end
end
