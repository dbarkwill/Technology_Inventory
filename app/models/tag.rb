class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :wikis, through: :taggings
end
