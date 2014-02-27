class CommentsController < ApplicationController
	wrap_parameters(:comment)

	def index 
		@day = Day.find(params[:day_id])
		@comments = @day.comments
	end
	def create
		@comment = Comment.create(comment_params)
		render(:layout => false)
	end
	private
		def comment_params
			params.require(:comment).permit(:name,:email,:body,:day_id)
		end
end
