class CommentsController < ApplicationController
	def create
		@comment = Comment.create(params[:comment].permit(:ccontent))

		@comment.user_id = session[:user_id]
		@comment.status_id = params[:status_id]
		
		if @comment.save
			@status = Status.new
			render "home/new", collection: @status, :notice => "Comment was saved"
		else
			@status = Status.new
			render "home/new", collection: @status, :notice => "Unable to save comment"
		end
	end
end
