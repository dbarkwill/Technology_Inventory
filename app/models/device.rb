class Device < ActiveRecord::Base
	belongs_to :device_group
	has_many :properties, :through => :device_group
	has_many :device_properties, dependent: :destroy
	accepts_nested_attributes_for :device_group
	has_many :networks, through: :addresses
	has_many :addresses, dependent: :destroy
	has_many :logs, dependent: :destroy
	has_many :checkout_histories, dependent: :destroy
	has_many :links, :as => :linkable
	has_many :articles, :through => :links
	has_many :uploads, :as => :uploadable, :dependent => :destroy


	def MAC
		self.devices_properties.each do |attrb|
			if attrb.attr.name.to_s == 'MAC'
				@MacAddress = attrb.value
			end
		end
		return @MacAddress if @MacAddress
	end

	def self.search(query)
	  where("asset_tag like ? OR name like ? OR notes like ?", "%#{query}%", "%#{query}%", "%#{query}%") 
	end

	def self.all_checked_in
		where(:checkedout => false)
	end
end
