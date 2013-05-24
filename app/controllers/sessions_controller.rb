class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: "You've signed in!"
    else
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to signin_url
  end

end
