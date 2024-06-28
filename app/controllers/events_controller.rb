class EventsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @event = Event.new
    @bill = Event.new
    @bill.save
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
    @qr = RQRCode::QRCode.new(@event.link)
    @svg = @qr.as_svg(
      offset: 0,
      color: "000",
      shape_rendering: 'crispEdges',
      module_size: 7,
      standanalone: true
      )
  end

  private

  def event_params
    params.require(:event).permit(:name, :link, :user, :total_amount)
  end

end
