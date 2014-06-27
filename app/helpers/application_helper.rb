module ApplicationHelper

	def attribute_form_generator(attr_fields, attributeObj)
		case attributeObj.attr.style.to_s
		when 'Text Field'
			return attr_fields.text_field :value,  class:"form-control"
		when 'Text Area'
			return attr_fields.text_area :value,  class:"form-control"
		when 'Dropdown List'
			values = attributeObj.attr.values.split(",").each {|v| v.strip!}
			return attr_fields.select :value, options_for_select(values, :selected => attributeObj.value), { :prompt => true}, { class:"form-control"}
			#return values
		else
			return attr_fields.text_field :value, class:"form-control"
		end
	end

	def cp(path)
		"class='active'".html_safe if current_page?(path)
	end
	
end
