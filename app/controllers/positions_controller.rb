class PositionsController < ApplicationController
	def index
		@positions = Position.all
	end
	def new
		@position = Position.new
	end

	def edit
		@position = Position.find(params[:id])
	end

	def update
		@position = Position.find(params[:id])
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
		@position = Position.find(params[:id])
	end

	private
		def position_params
			params.require(:position).permit(:name, :allocated_money)
		end
end