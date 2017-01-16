module CodeHelper

	def get_code
		if Code.first == nil
			return nil
		else
			return Code.first.code
		end
	end

	def get_appropriate_link_code
		if get_code == nil && current_user.admin?
			content_tag(:small, link_to("[add]", new_code_path), :class => 'nil')
		else
			content_tag(:small, link_to("edit", edit_code_path(Code.first)), :class => 'nil')
		end
	end

end
