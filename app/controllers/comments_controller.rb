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
end
