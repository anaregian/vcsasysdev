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
end