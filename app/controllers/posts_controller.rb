class PostsController < ApplicationController
  before_filter :user_signed_in, except: [:index, :show]
  before_filter :find_post, only: [:show, :edit, :update, :vote]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user

    if @post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    if @post.update_attributes(params[:post])
      flash[:success] = 'Post was successfully updated.'
      redirect_to @post
    else
      render 'edit'
    end
  end

  def vote
    @vote = Vote.create(vote: params[:vote], voteable: @post, user_id: current_user.id)

    respond_to do |format|
      format.html {
        flash[:notice] = "Your vote was accepted."
        redirect_to :back
      }
      format.js
    end
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end
end
