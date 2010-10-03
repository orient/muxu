class HomeController < ApplicationController
  def index
  	@comments_index = Comment.find_recent :limit =>10
  	@comments_hot_index = Comment.find_hot :limit =>5
  end

end
