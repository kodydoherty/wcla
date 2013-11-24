class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :update, :destroy]
	before_action :require_user, only: [:index, :edit,:update,:destroy]
	before_action :require_admin, only: [:destroy]
	
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "You've registered succesfully."
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:notice] = "You account has been updated."
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		@user.destroy
		flash[:notice] = "Account had been deleted"
		redirect_to root_path
	end

	def find_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :password, :unit, :first_name, :last_name)
	end
end