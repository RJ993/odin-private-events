class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    @event = User.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def event_params
    params.expect(event: [ :title, :description, :creator ])
  end
end
