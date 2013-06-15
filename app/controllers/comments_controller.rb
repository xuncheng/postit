class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user_id = '1'

    if @comment.save
      flash[:success] = 'Comment was successfully created.'
      redirect_to @post
    else
      render 'posts/show'
    end
  end
end
