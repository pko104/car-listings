class CarsController < ApplicationController

  def create
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @car = Car.new(car_params)
    @car.manufacturer_id = @manufacturer.id

    if @car.save
      redirect_to manufacturer_path(id: @manufacturer.id), notice: "Your car was submitted."
    else
      flash.now[:notice]= @car.errors.full_messages
      render :new
    end
  end

  def new
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
  end

  private

  def car_params
    params.require(:car).permit(:mileage, :manufacturer_id, :color, :year, :description)
  end

end

