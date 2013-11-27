class DocsController < ApplicationController
  before_action :set_post, only: [:edit, :update]
  before_action :require_user, only: [ :index]
  before_action :require_admin, except: [:index] 

  def index
  	@docs = Doc.all.sort
  end
  def new 
    @doc_type = DocType.find(params[:doc_type_id])
  	@doc = Doc.new
  end

  def create 
    @doc_type = DocType.find(params[:doc_type_id])
  	@doc = @doc_type.docs.build(doc_params)
  	@doc.user = current_user

  	if @doc.save
  		flash[:notice] = "Doc created successfully"
  		redirect_to doc_types_path

  	else
  		render :new
  	end
  end

  def edit 
    @doc_type = DocType.find(params[:doc_type_id])
    @doc = @doc_type.docs.find(params[:id])
  end

  def update
  	if @doc.update(doc_params)
  		flash[:notice] = "Post created successfully"
  		redirect_to doc_types_path

  	else
  		render :update
  	end
  end

  def destroy
    @doc_type = DocType.find(params[:doc_type_id])
    @doc = @doc_type.docs.find(params[:id])
    @doc.destroy
    flash[:notice] = "The document was deleted succesfully."
    redirect_to doc_types_path
  end

  private

  def set_post
    @doc = Doc.find(params[:id])
  end
  def require_creator
    access_denied unless logged_in? && (current_user == @doc.user || current_user.admin?)
  end

  def doc_params
  	params.require(:doc).permit(:title, :url)
  end
end