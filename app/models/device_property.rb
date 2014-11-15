class DeviceProperty < ActiveRecord::Base
  belongs_to :property
  belongs_to :device


  	def self.search(query)
	  	where("value like ?", "%#{query}%") 
	end
end
