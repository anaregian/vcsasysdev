class EstimationsController < ApplicationController
	def new
		@estimation = Estimation.new
	end

	def create
		@estimation = Estimation.new(estimation_params)
		if @estimation.save
			flash[:success] = "New estimation added"
			redirect_to positions_path
		else
			render 'new'
		end
	end

	def edit
		@estimation = Estimation.find(params[:id])
	end

	def update
		@estimation = Estimation.find(params[:id])
		if @estimation.update(estimation_params)
			flash[:success] = "Estimation updated"
			redirect_to positions_path
		else
			render 'edit'
		end
	end

	# Assigns the parameters entered while creating or editing an estimation
	def estimation_params
		params.require(:estimation).permit(:estimate)
	end
end