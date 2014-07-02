class Person < ActiveRecord::Base


	def name
		return "#{self.first_name} #{self.last_name}"
	end
end
