class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:show, :index, :new, :create]
  before_action :require_creator, only: [:edit, :update, :destroy]

  def index
  	@posts = Post.all.sort
  end

  def show 

    @comments = @post.comments.all.sort
    @comment = Comment.new
  end
  def new 
  	@post = Post.new
    
  end

  def create 
  	@post = Post.new(post_params)
  	@post.user = current_user

  	if @post.save
  		flash[:notice] = "Post created successfully"
  		redirect_to posts_path

  	else
  		render new_post_path
  	end
  end

  def edit 

  end

  def update

  	if @post.update(post_params)
  		flash[:notice] = "Post created successfully"
  		redirect_to posts_path

  	else
  		render :update
  	end
  end
  def vote
    @vote = Vote.create(voteable: @post, user: current_user, vote: params[:vote])

    respond_to do |format|
      format.html do
        if @vote.valid?
          flash[:notice] = "Your vote was counted."
        else
          flash[:error] = 'You can only vote on a post once.'
        end
        redirect_to :back
      end
      format.js
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
  def require_creator
    access_denied unless logged_in? && (current_user == @post.user || current_user.admin?)
  end

  def post_params
  	params.require(:post).permit!
  end
end
