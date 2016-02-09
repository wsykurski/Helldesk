class SessionsController < ApplicationController
  skip_before_action :authorize, :only => [:new, :create]
  def new
  end

  def create
    if user = User.authenticate(params[:name],params[:password])
      session[:user_id] = user.id
      redirect_to issues_url, :notice => "You logged in - hope You do some work"
    else
      redirect_to login_url, :alert => "Do you feel lucky, punk?"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to welcome_url, notice: 'Thanks God, You have logged out'
  end
end
