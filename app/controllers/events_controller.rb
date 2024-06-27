class EventsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to event_link_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
  end

  def link
    @event = Event.find(params[:event_id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :link, :user, :total_amount)
  end

end
