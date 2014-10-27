module ApplicationHelper

	def property_form_generator(property_field, propertyObj)
		case propertyObj.property.style.to_s
		when 'Text Field'
			return property_field.text_field :value,  class:"form-control"
		when 'Text Area'
			return property_field.text_area :value,  class:"form-control"
		when 'Dropdown List'
			values = propertyObj.property.values.split(",").each {|v| v.strip!}
			return property_field.select :value, options_for_select(values, :selected => propertyObj.value), { :prompt => true}, { class:"form-control"}
			#return values
		when 'Person Select'
			values = Person.all.map {|person| [person.name, person.name]}
			return property_field.select :value, options_for_select(values, :selected => propertyObj.value), { :prompt => true}, { class:"form-control"}
			#return values
		else
			return property_field.text_field :value, class:"form-control"
		end
	end

	def cp(path)
		"class='active'".html_safe if current_page?(path)
	end
	
end
