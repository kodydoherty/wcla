class SessionsController < ApplicationController

	def new; end

	def doc; end
	def sale; end

	def create
		user = User.where(username: params[:username]).first

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:notice] = "Welcome, you've logged in."
			redirect_to root_path
		else
			flash[:error] = "Sorry, something is wrong with your username or password."
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:error] = "You've logged out successfully."
		redirect_to root_path
	end
end