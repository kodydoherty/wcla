class DocTypesController < ApplicationController
	before_action :require_user, only: [:new, :create]
	before_action :find_category, only: [:show, :edit, :update, :destroy]
	before_action :require_user, only: [:show, :index, :new, :create]
  	before_action :require_creator, only: [:edit, :update, :destroy]
	
	def index
		@doc_types = DocType.all
	end
	def show
		@doc_type = DocType.find(params[:id])
		@docs = @doc_type.docs.all
	end

	def new
		@doc_type = DocType.new
	end

	def create
		@doc_type = DocType.new(doc_type_params)

		if @doc_type.save
			flash[:notice] = "The category was created successfully"
			redirect_to doc_types_path
		else
			render :new
		end
	end

	def edit; end

	def update 
		if @doc_type.update(doc_type_params)
			flash[:notice] = "The category was updated successfully"
			redirect_to doc_types_path
		else
			render :edit
		end
	end

	def destroy
		@doc_type.destroy
		flash[:notice] = "The category was deleted successfully"
		redirect_to doc_types_path
	end

	def doc_type_params
		params.require(:doc_type).permit(:name)
	end

	def find_category
		@doc_type = DocType.find(params[:id])
	end 
end