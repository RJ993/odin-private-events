class EventRegistrationsController < ApplicationController
  before_action :authenticate_user!
  def create
    @event = Event.find(params[:event_id])
    @event_registration = @event.event_registrations.build(attendee: current_user)
    # @event_registration = @event.event_registrations.build(reg_params)

    if @event_registration.save
      redirect_to @event
      flash[:notice] = "You have registered."
    else
      flash.now[:alert] = "Something is not right."
      redirect_to @event
    end

    # private

    # def reg_params
    # params.expect(event_registration: [ attendee_id: current_user, relevant_event_id: @event ])
    # end
  end


  def destroy
    @event = Event.find(params[:event_id])
    @event_registration = @event.event_registrations.find_by(relevant_event_id: params[:event_id], attendee: current_user)

    if @event_registration
      @event_registration.destroy
      redirect_to @event
      flash[:notice] = "You are no longer in attendance."
    else
      flash.now[:alert] = "Something is not right."
      redirect_to @event
    end
  end
end
