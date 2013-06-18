class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Signed in successfully, welcome to the Postit!"
      redirect_to user
    else
      render 'new', error: "Invalid email/password combination"
    end
  end

  def destroy
    sign_out
    flash[:success] = "You have been logged out."
    redirect_to root_path
  end
end
