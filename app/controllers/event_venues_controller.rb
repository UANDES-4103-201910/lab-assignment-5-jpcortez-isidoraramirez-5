class EventVenuesController < ApplicationController
skip_before_action :verify_authenticity_token
  def create
	@event_venue = EventVenue.create(event_venue_params)
	render json: @event_venue
  end

  def destroy
	@event_venue = EventVenue.find(params[:id]).destroy
	format.json { head :no_content
  end

  def update
	respond_to do |format|
		if EventVenue.update(event_venue_params)
			@event_venue = EventVenue.update(event_venue_params)
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
  private

  def event_venue_params
        params.require(:event_venue).permit(:id, :name, :address, :capacity)
  end
end
