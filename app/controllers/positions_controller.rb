# Controller for the positions

class PositionsController < ApplicationController
	# Calls the set_position method before executing edit, update, show or destroy actions
	before_action :set_position, only: [:edit, :update, :show, :destroy]
	before_action :require_user


	# Controls the positions list page
	def index
		@positions = Position.search_pos(params[:search])
		@incomes = Income.all
		@estimation = Estimation.first
		@all_positions = Position.all
	end

	# Controls the process of creating a new position
	def new
		@position = Position.new
	end

	# Creates the new position
	def create
		@position = Position.new(position_params)
		if @position.save
			flash[:success] = "Position Created"
			redirect_to position_path(@position)
		else
			render 'new'
		end
	end

	# Controls the process of editing an existing position
	def edit

	end

	# Updates the edited position
	def update
		if @position.update(position_params)
			flash[:success] = "Position updated"
			redirect_to position_path(@position)
		else
			render 'edit'
		end
	end

	# Controls the show page of an individual position
	def show
		@activities = Position.find(params[:id]).activities.search_act(params[:search])
	end

	# Deletes a position
	def destroy
		@position.destroy
		flash[:danger] = "The position and all its activities were deleted"
		redirect_to positions_path
	end

	# Private methods
	private

	# Sets the position variable to the selected position
	def set_position
		@position = Position.find(params[:id])
	end

	# Assigns the parameters entered while creating or editing a position
	def position_params
		params.require(:position).permit(:name, :allocated_money)
	end
end