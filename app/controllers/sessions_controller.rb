class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'logged in'
      redirect_to posts_path
    else
      flash[:danger] = 'login failed'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice ]= 'logged out'
    redirect_to new_session_path
  end
  end
