# Controller for the incomes

class IncomesController < ApplicationController

	# Calls the set_income method before executing edit, update, show or destroy actions
	before_action :set_income, only: [:edit, :update, :show, :destroy]

	def index
		@incomes = Income.all
	end

	def new
		@income = Income.new
	end

	def create
		@income = Income.new(income_params)
		if @income.save
			flash[:success] = "New income added"
			redirect_to income_path(@income)
		else
			render 'new'
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		if @income.update(income_params)
			flash[:success] = "Income updated"
			redirect_to income_path(@income)
		else
			render 'edit'
		end
	end

	def destroy
		@income.destroy
		flash[:danger] = "Income was deleted"
		redirect_to incomes_path
	end

	private
	# Sets the income variable to the selected income
	def set_income
		@income = Income.find(params[:id])
	end

	# Assigns the parameters entered while creating or editing a income
	def income_params
		params.require(:income).permit(:description, :amount, :received_at)
	end
end