class AdminController < ApplicationController
  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        uri = session[:custom_uri] || session[:original_uri]
		session[:original_uri] = nil
		session[:custom_uri] = nil
		redirect_to(uri || { :controller =>"objs",:action => "index" })
      else
        flash.now[:notice] = "Invalid user/password combination"
      end
    end
  end
  

  
  def logout
    
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:controller => "objs", :action=>"index") 
  end

  def index
  	@user = User.find(session[:user_id])
  end


end
