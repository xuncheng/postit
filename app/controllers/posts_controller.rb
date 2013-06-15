class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @comment = @post.comments.build
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = '1'

    if @post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      flash[:success] = 'Post was successfully updated.'
      redirect_to @post
    else
      render 'edit'
    end
  end
end
