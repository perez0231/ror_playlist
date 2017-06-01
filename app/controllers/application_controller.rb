class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  User.find(session[:user_id]) if session[:user_id]
end

def required_login
  if (!session[:user_id])
    redirect_to '/'
  end

end
helper_method :current_user
end
