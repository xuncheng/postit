class UsersController < ApplicationController
  before_filter :find_user, only: [:show, :posts, :comments]
  before_filter :user_signed_in, only: [:edit, :update]
  before_filter :correct_user, only: [:edit, :update]

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params[:user])

    if @user.save
      sign_in @user
      flash[:success] = "Signed in successfully, welcome to the Postit!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if @user.update_attributes(user_params[:user])
      flash[:success] = "Profile successfully updated."
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def posts
    @posts = @user.posts
  end

  def comments
    @comments = @user.comments.order("created_at desc")
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path, notice: 'Permission.' unless current_user?(@user)
  end

  def user_params
    params.permit(user: [:username, :email, :password, :password_confirmation])
  end
end
