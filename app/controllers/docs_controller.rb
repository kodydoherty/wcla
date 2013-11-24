class DocsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, only: [:show, :index]
  before_action :require_admin, except: [:index, :show] 

  def index
  	@docs = Doc.all.sort
  end

  def show 
  end
  def new 
  	@doc = Doc.new
  end

  def create 
  	@doc = Doc.new(doc_params)
  	@doc.user = current_user

  	if @pdoc.save
  		flash[:notice] = "Doc created successfully"
  		redirect_to doc_types_path

  	else
  		render :new
  	end
  end

  def edit 
  end

  def update
  	if @doc.update(doc_params)
  		flash[:notice] = "Post created successfully"
  		redirect_to doc_types_path

  	else
  		render :update
  	end
  end

  private

  def set_post
    @doc = Doc.find(params[:id])
  end
  def require_creator
    access_denied unless logged_in? && (current_user == @doc.user || current_user.admin?)
  end

  def doc_params
  	params.require(:doc).permit(:titel, :body)
  end
end