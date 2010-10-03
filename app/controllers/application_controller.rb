class ApplicationController < ActionController::Base
#  before_filter :authorize, :except => :login
  protect_from_forgery
	def current_user
		@current_user || User.find(seesion[:user_id])
	end 
  
protected
  def authorize
    unless User.find_by_id(session[:user_id])
      session[:original_uri] = (session[:custom_uri] || request.request_uri)
      flash[:notice] = "Please log in"
      redirect_to :controller => 'admin', :action => 'login'
    end
  end
end
