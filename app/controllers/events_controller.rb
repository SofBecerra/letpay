class EventsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def link
    @event = Event.find(params[:event_id])
  end

end
