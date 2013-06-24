class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user = current_user

    if @comment.save
      flash[:success] = 'Comment was successfully created.'
      redirect_to @post
    else
      render 'posts/show'
    end
  end

  def vote
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @vote = Vote.create(vote: params[:vote], voteable: @comment, user_id: current_user.id)

    respond_to do |format|
      format.html {
        flash[:notice] = "Your vote was accepted."
        redirect_to :back
      }
      format.js
    end
  end
end
