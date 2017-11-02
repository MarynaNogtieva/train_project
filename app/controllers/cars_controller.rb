class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  before_action :set_train, only: %i[new create edit update]

  def index
    @cars = Car.all
  end

  def show; end

  def new
    @car = Car.new
  end

  def create
    @car = @train.cars.new(car_params)
    if @car.save
      redirect_to @train
    else
      render :new
    end
  end

  def edit; end

  def update
    if @car.update(car_params)
       redirect_to @train
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end
  
  private
  
  def set_train
    @train = Train.find(params[:train_id])
  end
  
  def set_car
    @car = Car.find(params[:id])
  end
  
  def car_params
    params.require(:car).permit(:type, :number, :bottom_seats, :top_seats, :top_side_seats, :bottom_side_seats, :seated_seats, :train_id)
  end
end
