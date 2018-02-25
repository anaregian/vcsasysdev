module ApplicationHelper

	def get_progression
		today = Date.today
		end_date = Date.new(today.year, 6, 1)
		
		if today >= end_date
			end_date = Date.new(today.year + 1, 6, 1)
		end

		number_of_days = (end_date - today).abs
		
		puts today
		puts end_date
		puts number_of_days
		
		return 100 - ((number_of_days / 365) * 100)
	end

	def high_spending(progress)
	  	if progress > get_progression
				return "danger"
		end
	end

end
