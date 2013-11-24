class CategoriesController < ApplicationController
	before_action :find_category, only: [:show, :edit, :update, :destroy]
	before_action :require_user, only: [:show, :index, :new, :create]
  	before_action :require_creator, only: [:edit, :update, :destroy]
	
	def index
		@categories = Category.all
	end
	def show
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			flash[:notice] = "The category was created successfully"
			redirect_to categories_path
		else
			render :new
		end
	end

	def edit; end

	def update 
		if @category.update(category_params)
			flash[:notice] = "The category was updated successfully"
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		@category.destroy
		flash[:notice] = "The category was deleted successfully"
		redirect_to categories_path

	end

	def category_params
		params.require(:category).permit(:name)
	end

	def find_category
		@category = Category.find(params[:id])
	end
	def require_creator
    	access_denied unless logged_in? && (current_user == @category.user || current_user.admin?)
  	end

end