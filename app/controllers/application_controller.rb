class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :getUser
  before_action :authorize

  protected 

  def isAdmin?
    unless @current_user.admin?
      redirect_to login_url, notice: "Want to be admin, huh?"
    end
  end

  private

  def getUser
    @current_user = User.find_by(id: session[:user_id])
  end

  def authorize
    unless @current_user
      redirect_to login_url, notice: "Must logon !!!"
    end
  end

end
