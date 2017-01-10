# Controller for the memo

class MemosController < ApplicationController

	# Calls the set_memo method before executing edit, update, show or destroy actions
	before_action :set_memo, only: [:edit, :update, :show, :destroy]

	def index
		@memo = Memo.all
	end

	def new
		@memo = Memo.new
	end

	def create
		@memo = Memo.new(memo_params)
		@memo.user_id = current_user.id
		if @memo.save
			flash[:success] = "New memo added"
			redirect_to memo_path(@memo)
		else
			render 'new'
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		if @memo.update(memo_params)
			flash[:success] = "Memo updated"
			redirect_to memo_path(@memo)
		else
			render 'edit'
		end
	end

	def destroy
		@memo.destroy
		flash[:danger] = "Memo was deleted"
		redirect_to memos_path
	end

	private
	# Sets the memo variable to the selected memo
	def set_memo
		@memo = Memo.find(params[:id])
	end

	# Assigns the parameters entered while creating or editing a memo
	def memo_params
		params.require(:memo).permit(:description)
	end
end