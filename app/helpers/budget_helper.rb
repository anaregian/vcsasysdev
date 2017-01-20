module BudgetHelper
	def get_total_budget(income)
		total = 0
		income.all.each do |i|
			total += i.amount
		end	
		return total
	end

	def get_total_amount_spent
		total = 0
		pos = Position.all
		pos.each do |p|
			total += get_position_amount_spent(p)
		end
		return total
	end

	def get_total_amount_left(income)
		return get_total_budget(income) - get_total_amount_spent
	end
end