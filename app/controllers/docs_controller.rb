class DocsController < ApplicationController
  before_action :set_type, only: [:new, :create]
  before_action :require_user, only: [:index]
  before_action :require_admin, except: [:index] 
  before_action :type_and_doc, only: [:destroy, :edit]

  def index
  	@docs = Doc.all.sort
  end
  def new 
  	@doc = Doc.new
  end

  def create 
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
  end

  def update
    @doc = Doc.find(params[:id])
  	if @doc.update(doc_params)
  		flash[:notice] = "Post created successfully"
  		redirect_to doc_types_path

  	else
  		render :update
  	end
  end

  def destroy
    @doc.destroy
    flash[:notice] = "The document was deleted succesfully."
    redirect_to doc_types_path
  end

  private

  def type_and_doc
    @doc_type = DocType.find(params[:doc_type_id])
    @doc = @doc_type.docs.find(params[:id])
  end

  def set_type
    @doc_type = DocType.find(params[:doc_type_id])
  end
  def require_creator
    access_denied unless logged_in? && (current_user == @doc.user || current_user.admin?)
  end

  def doc_params
  	params.require(:doc).permit(:title, :url)
  end
end