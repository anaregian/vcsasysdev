module PositionHelper
	def get_position_amount_spent(position)
		total = 0
		position.activities.each do |a|
			total += get_activity_amount_spent(a)
		end
		return total
	end

	def get_position_amount_left(position)
		return position.allocated_money - get_position_amount_spent(position)
	end

	def get_total_position_allocated_money
		@positions.sum(:allocated_money)
	end

	def get_total_position_amt_spent
		total = 0;
		@positions.each do |p|
			total += get_position_amount_spent(p)
		end
		return total
	end

	def get_total_position_amt_left
		total = 0;
		@positions.each do |p|
			total += get_position_amount_left(p)
		end
		return total
	end

	def get_position_budget_progress(position)
		return (get_position_amount_spent(position) / position.allocated_money) * 100
	end
end
