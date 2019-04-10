class EventVenuesController < ApplicationController
skip_before_action :verify_authenticity_token
  def create
	@event_venue = EventVenue.create(params[:name], params[:address], params[:capacity])
	render json: @event_venue
  end

  def destroy
	@event_venue = EventVenue.find(params[:id]).destroy
	respond_to do |format|
		format.json { head :no_content }
	end
  end

  def update
	respond_to do |format|
		if EventVenue.update(params[:name], params[:address], params[:capacity])
			@event_venue = EventVenue.update(params[:name], params[:address], params[:capacity])
			format.json { head :no_content }
		else
			format.json { render json: @event_venue.errors, status: :unprocessable_entity }
		end
	end
  end

  def show
	@event_venue = EventVenue.find(params[:id])
        render json: @event_venue
  end
end
