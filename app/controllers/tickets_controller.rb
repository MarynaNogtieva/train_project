class TicketsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_ticket, only: %i[show edit update destroy]
  def index
    @tickets = current_user.tickets
  end
  
  def show; end
  
  def new
    @ticket = Ticket.new
  end
  
  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end
  
  def edit; end
  
  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render 'edit'
    end
  end
  
  def destroy
    @ticket.destroy
    redirect_to tickets_path, notice: 'Ticket was successfully destroyed.'
  end
  
  private
  
  def set_ticket
    @ticket = current_user.tickets.find(params[:id])
  end
  
  def ticket_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id, :first_name, :last_name, :passport_number, :passport_series)
  end  
end
