class SearchController < ApplicationController
	def index
		@results = Obj.search params[:search]
	end
	
	def result
		
	end
end
