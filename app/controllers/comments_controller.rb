class CommentsController < ApplicationController
	def index 
		@day = Day.find(params[:day_id])
		@comments = @day.comments
	end
end
