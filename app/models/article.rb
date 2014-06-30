class Article < ActiveRecord::Base
	has_many :taggings
	has_many :tags, through: :taggings
	has_many :relatible, dependent: :destroy
	has_many :targets, :through => :relatible

	def self.tagged_with(name)
		Tag.find_by_name!(name).articles
	end

	def self.tag_counts
		tag.select("tags.*, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
	end

	def tag_list
		tags.map(&:name).join(", ")
	end

	def tag_list=(names)
		self.tags = names.split(",").map do |n|
			Tag.where(name: n.strip).first_or_create!
		end
	end
	
end
