module ApplicationHelper

	def attribute_form_generator(attr_fields, attributeObj)
		case attributeObj.attr.style.to_s
		when 'Text Field'
			return attr_fields.text_field :value, :name => "attr[#{attributeObj.attr_id}]", class:"form-control"
		when 'Text Area'
			return attr_fields.text_area :value, :name => "attr[#{attributeObj.attr_id}]", class:"form-control"
		when 'Dropdown List'
			values = attributeObj.attr.values.split(",").each {|v| v.strip!}
			return attr_fields.select :value, options_for_select(values), {:name => "attr[#{attributeObj.attr_id}]", :prompt => true}, {:name => "attr[#{attributeObj.attr_id}]", class:"form-control"}
		else
			return attr_fields.text_field :value, :name => "attr[#{attributeObj.attr_id}]", class:"form-control"
		end
	end
	
end
