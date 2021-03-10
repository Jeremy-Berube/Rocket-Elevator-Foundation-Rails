class TwiliosController < ApplicationController
  def create
    @elevator = Elevator.new(elevator_params)

    respond_to do |format|
      if @elevator.status = "Intervention"
        message = "The Elevator '#{@elevator.id}', Serial Number '#{@elevator.serial_number}' needs an intervention"
        Sendsms.new(message).call
      end
  end
end
