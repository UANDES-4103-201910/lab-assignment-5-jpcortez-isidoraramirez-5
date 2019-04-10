class EventsController < ApplicationController
 skip_before_action :verify_authenticity_token

  def create
	@event = Event.create(params[:name], params[:description], params[:star_date], params[:event_venue_id])
	render json: @event
  end

  def destroy
	@event = Event.find(params[:id]).destroy
	head :no_content

  end

  def update
	respond_to do |format|
		if Event.update(params[:name], params[:description], params[:star_date], params[:event_venue_id])
			@event = Event.update(params[:name], params[:description], params[:star_date], params[:event_venue_id])
			format.json { head :no_content }
		else
			format.json { render json: @event.errors, status: :unprocessable_entity }
		end
	end
  end

  def show
	@event = Event.find(params[:id])
        render json: @event
  end
end
