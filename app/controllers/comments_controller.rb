class CommentsController < ApplicationController
  before_filter :authorize
  def create
  	@obj = Obj.find(params[:obj_id])
  	@comment = @obj.comments.build(params[:comment])
  	@comment.user_id = session[:user_id] if session[:user_id]
  	
  	if @comment.save
  		redirect_to obj_path(@obj)
  	end
  end

end
