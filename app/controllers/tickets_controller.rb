class TicketsController < ApplicationController
  def create
	@ticket = Ticket.create(params[:ticket_type_id], params[:order_id])
	render json: @ticket
  end

  def destroy
	@ticket = Ticket.find(params[:id]).destroy
	respond_to do |format|
		format.json { head :no_content }
	end
  end

  def update
	respond_to do |format|
		if Ticket.update(params[:ticket_type_id], params[:order_id])
			@ticket = Ticket.update(params[:ticket_type_id], params[:order_id])
			format.json { head :no_content }
		else
			format.json { render json: @ticket.errors, status: :unprocessable_entity }
		end
	end
  end

  def show
	@ticket = Ticket.find(params[:id])
        render json: @ticket
  end
end