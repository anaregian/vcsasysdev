module ActivityHelper
	def get_activity_amount_spent(activity)
		total = 0
		activity.components.each do |c|
			total += c.cost
		end
		return total
	end

	def get_activity_amount_left(activity)
		return activity.allocated_money - get_activity_amount_spent(activity)
	end

	def get_total_activity_amt_spent
		total = 0;
		@activities.each do |a|
			total += get_activity_amount_spent(a)
		end
		return total
	end

	def get_total_activity_amt_left
		total = 0;
		@activities.each do |a|
			total += get_activity_amount_left(a)
		end
		return total
	end
end
