class PositionsController < ApplicationController
	before_action :set_position, only: [:edit, :update, :show, :destroy]
	def index
		@positions = Position.all
	end
	def new
		@position = Position.new
	end

	def edit

	end

	def update
		if @position.update(position_params)
			flash[:notice] = "Position updated"
			redirect_to position_path(@position)
		else
			render 'edit'
		end
	end

	def create
		@position = Position.new(position_params)
		if @position.save
			flash[:notice] = "Position Created"
			redirect_to position_path(@position)
		else
			render 'new'
		end
	end

	def show

	end

	def destroy
		@position.destroy
		flash[:notice] = "Position was deleted"
		redirect_to positions_path
	end

	private
	def set_position
		@position = Position.find(params[:id])
	end
	def position_params
		params.require(:position).permit(:name, :allocated_money)
	end
end