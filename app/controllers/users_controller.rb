class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
skip_before_action :verify_authenticity_token
  def create
	@user = User.create(user_params)
	render json: @user
  end

  def destroy
	@user = User.find(params[:id]).destroy
	head :no_content 
  end

  def update
	respond_to do |format|
		if User.find(params[:id]).update(user_params)
			@user = User.find(params[:id]).update(user_params)

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
      params.require(:user).permit( :name, :lastname, :email, :phone_number, :password, :address )
      #params.permit( :name, :last_name, :email, :phone_number, :password, :address )
  end

  def set_user
    @user = User.find(params[:id])
  end

end


#{"user":{"name": "Isidora","lastname": "ramirez","email":"isi@mail.com","password": "123","address": "calle"}} ESTO SIRVE PARA CREAR
