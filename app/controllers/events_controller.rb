class EventsController < ApplicationController
 skip_before_action :verify_authenticity_token

  def create
	@event = Event.create(event_params)
	render json: @event
  end

  def destroy
	@event = Event.find(params[:id]).destroy
	head :no_content

  end

  def update
	respond_to do |format|
		if Event.update(event_params)
			@event = Event.update(event_params)
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

  def upcoming_events
	now = Date.today
	three = Date.today.next_month(3)
	@event = Event.where('start_date >= ? AND start_date <= ?', now, three)
	render json: @event
  end
  private

  def event_params
        params.require(:event).permit(:id, :name, :description, :start_date, :event_venue_id)
  end

end
