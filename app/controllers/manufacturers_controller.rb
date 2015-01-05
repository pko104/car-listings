class ManufacturersController < ApplicationController

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      redirect_to '/', notice: "Your manufacturer was submitted."
    else
      flash.now[:notice] = @manufacturer.errors.full_messages
      render :new
    end
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    @cars = Car.where(manufacturer_id: params[:id])
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country_name)
  end

end


