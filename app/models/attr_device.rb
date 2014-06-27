class AttrDevice < ActiveRecord::Base
  belongs_to :attr
  belongs_to :device


  	def self.search(query)
	  	where("value like ?", "%#{query}%") 
	end
end
