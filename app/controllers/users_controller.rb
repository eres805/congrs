class UsersController < ApplicationController

before_action :authenticate, only: [:index, :show, :edit, :update, :destroy]

	def index 
		@users = User.all 
	end

	def show 
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		redirect_to root_path
	end

	def edit 
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to(@user)
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end


	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end