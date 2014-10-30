class Article < ActiveRecord::Base
	has_many :taggings
	has_many :tags, through: :taggings
	has_many :links, :dependent => :destroy
	has_many :devices, :through => :links, :source => :linkable, :source_type => "Device"
	has_many :device_groups, :through => :links, :source => :linkable, :source_type => "DeviceGroup"
	belongs_to :user
	has_many :uploads, :as => :uploadable, :dependent => :destroy

	scope :published, where(:published => true)

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

	def self.search(query)
		where("title like ? OR summary like ? OR content like ?", "%#{query}%", "%#{query}%", "%#{query}%").where(:published =>  true)
	end
	
end
