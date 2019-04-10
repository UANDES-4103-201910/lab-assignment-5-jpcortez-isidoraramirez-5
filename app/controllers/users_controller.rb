class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
skip_before_action :verify_authenticity_token
  def create
	@user = User.create(user_params)
	format.json { render action: 'show', status: :created, location: @user }
  end

  def destroy
	@user = User.find(params[:id]).destroy
	respond_to do |format|
		format.json { head :no_content }
	end
  end

  def update
	respond_to do |format|
		@user = User.update(user_params)
		if User.update(user_params)
			
			format.json { head :no_content }
		else
			format.json { render json: @user.errors, status: :unprocessable_entity }
		end
	end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def user_params
      params.require(:user).permit( :name, :last_name, :email, :phone_number, :password, :address )
  end
private
  def set_user
    @user = User.find(params[:id])
  end

end
