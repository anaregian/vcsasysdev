module EstimateHelper
	def get_estimate
		if Estimation.first == nil
			return nil
		else
			return Estimation.first.estimate
		end
	end

	def get_appropriate_link
		if get_estimate == nil
			content_tag(:small, link_to("[add]", new_estimation_path), :class => 'nil')
		else
			content_tag(:small, link_to("edit", edit_estimation_path(Estimation.first)), :class => 'nil')
		end
	end

	def get_estimate_amount_left
		if get_estimate == nil
			return 0
		else
			return get_estimate - get_total_amount_spent
		end
	end
end