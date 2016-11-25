class ComponentsController < ApplicationController

	# Calls the set_activity method before executing edit, update, show or destroy actions
	before_action :set_component, only: [:edit, :update, :show, :destroy]
	before_action :require_user

	# Controls the component list page
	def index
		@components = Component.all
	end
	# Controls the process of creating a new comopnent
	def new
		@component = Component.new
	end

	# Creates the new component
	def create
		@component = Component.new(component_params)
		if @component.save
			flash[:success] = "Component Created"
			redirect_to component_path(@component)
		else
			render 'new'
		end
	end

	# Controls the process of editing an existing component
	def edit

	end

	# Updates the edited position
	def update
		if @component.update(component_params)
			flash[:success] = "Component updated"
			redirect_to component_path(@component)
		else
			render 'edit'
		end
	end

	def show

	end

	# Deletes a component
	def destroy
		@component.destroy
		flash[:danger] = "component was deleted"
		redirect_to components_path
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