class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to @car
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to @car
    else
      render :edit
      
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end
  
  

  private

  def set_car
    @car = Car.find(params[:id])
  end
  
  def type
    Car.types.include?(params[:type]) ? params[:type] : "Car"
  end

  def car_params
    params.require(type.underscore.to_sym).permit(:car_type, :type, :number, :bottom_seats, :top_seats,:top_side_seats, :bottom_side_seats, :seated_seats, :train_id, :car)
  end
end