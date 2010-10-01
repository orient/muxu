class ApplicationController < ActionController::Base
#  before_filter :authorize, :except => :login
  protect_from_forgery
 
  
protected
  def authorize
    unless User.find_by_id(session[:user_id])
      session[:original_uri] = (session[:custom_uri] || request.request_uri)
      flash[:notice] = "Please log in"
      redirect_to :controller => 'admin', :action => 'login'
    end
  end
end
