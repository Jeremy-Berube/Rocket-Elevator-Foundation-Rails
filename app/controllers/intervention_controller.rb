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
        puts params
        intervention = Intervention.new
        intervention.author = current_user.id
        intervention.report = params[:description]
        intervention.customers_id = params[:customer_id]
        intervention.buildings_id = params[:building_id]

        # if @batteryList.status == 'Intervention'
        #     intervention.batteries_id = params[:battery_id]
        # end

        # if @columnList.status == 'Intervention'
        #     intervention.columns_id = params[:column_id]
        # end

        # if @elevatorList.status == 'Intervention'        
        # intervention.elevators_id = params[:elevator_id]
        # end 

        intervention.employees_id = params[:employee_id]
        intervention.save!

        if intervention.save! 
            redirect_back fallback_location: intervention_path, notice:"Your intervention was successfully stored"
        end
    end
end
