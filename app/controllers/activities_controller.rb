# Controller for the activities

class ActivitiesController < ApplicationController
	# Calls the set_activity method before executing edit, update, show or destroy actions
	before_action :set_activity, only: [:edit, :update, :show, :destroy]

	# Controls the positions list page
	def index
		@activities = Activity.all
	end

	# Controls the process of creating a new activity
	def new
		@activity = Activity.new
	end

	# Creates the new activity
	def create
		@activity = Activity.new(activity_params)
		if @activity.save
			flash[:success] = "Activity Created"
			redirect_to activity_path(@activity)
		else
			render 'new'
		end
	end

	# Controls the process of editing an existing activity
	def edit

	end

	# Updates the edited position
	def update
		if @activity.update(activity_params)
			flash[:success] = "Activity updated"
			redirect_to activity_path(@activity)
		else
			render 'edit'
		end
	end

	# Controls the show page of an individual activity
	def show
	end

	# Deletes an activity
	def destroy
		@activity.destroy
		flash[:danger] = "activity was deleted"
		redirect_to activities_path
	end

	# Private methods
	private

	# Sets the position variable to the selected position
	def set_activity
		@activity = Activity.find(params[:id])
	end

	# Assigns the parameters entered while creating or editing a position
	def activity_params
		params.require(:activity).permit(:activity_name, :allocated_money, :position_id)
	end
end