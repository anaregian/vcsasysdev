class ComponentsController < ApplicationController

	# Calls the set_activity method before executing edit, update, show or destroy actions
	before_action :set_component, only: [:edit, :update, :show, :destroy]

	# Controls the component list page
	def index
		@components = Component.all
	end
	# Controls the process of creating a new activity
	def new
		@component = Component.new
	end

	# Creates the new activity
	def create
		@component = Component.new(component_params)
		if @component.save
			flash[:success] = "Component Created"
			redirect_to component_path(@component)
		else
			render 'new'
		end
	end

	def show

	end

	# Private methods
	private
	# Sets the component variable to the selected component
	def set_component
		@component = Component.find(params[:id])
	end

	# Assigns the parameters entered while creating or editing a component
	def component_params
		params.require(:component).permit(:component_name, :description, :cost, :activity_id)
	end
end