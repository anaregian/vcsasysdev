# Controller for the comment

class CommentsController < ApplicationController

	# Calls the set_comment method before executing edit, update, show or destroy actions
	before_action :set_comment, only: [:edit, :update, :show, :destroy]

	def index
		@comment = Comment.all
	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:success] = "New comment added"
			redirect_to comment_path(@comment)
		else
			render 'new'
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		if @comment.update(comment_params)
			flash[:success] = "Comment updated"
			redirect_to comment_path(@comment)
		else
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		flash[:danger] = "Comment was deleted"
		redirect_to comments_path
	end

	private
	# Sets the comment variable to the selected comment
	def set_comment
		@comment = Comment.find(params[:id])
	end

	# Assigns the parameters entered while creating or editing a comment
	def comment_params
		params.require(:comment).permit(:description)
	end
end