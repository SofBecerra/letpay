class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def show
    @bill = Bill.find(params[:bill_id])
    @ticket = Ticket.find(params[:id])
  end

  # GET /tickets/new
  def new
    @bill = Bill.find(params[:bill_id])
    @ticket = Ticket.new
  end

    # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      @bill = Bill.find(params[:bill_id])
      redirect_to bill_ticket_path(@bill), notice: " ticket escaneado"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def ticket_params
    params.require(:ticket).permit(:title, :photo)
  end
end
