class TicketsController < ApplicationController
    before_action :set_parameters, only: [:new, :create]
  
  def index
    @tickets = Ticket.all
  end
  
  def show
    @ticket = Ticket.find(params[:id])
    @passenger = User.find(@ticket.user_id)
  end
  
  def new
    @ticket = Ticket.new
  end
  
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = User.find(3)
    
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  
  private
  def ticket_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id)
  end
  
  def set_parameters
    @ticket_params = params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id).to_hash
  end
end