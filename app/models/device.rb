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
	has_many :loan_line_items, :as => :loanable
	has_many :loans, :through => :loan_line_items

	enum status: [:pending, :ready_to_deploy, :deployed, :development, :out_for_repair, :lost, :broken, :requestable, :loaned, :archived]

	def MAC
		self.device_properties.each do |device_property|
			if device_property.property.name.to_s == 'MAC'
				@MacAddress = device_property.value
			end
		end
		return @MacAddress if @MacAddress
	end

	def asset_tag
		self.device_properties.each do |device_property|
			if device_property.property.name.to_s == 'Asset Tag'
				@asset_tag = device_property.value
			end
		end
		return @asset_tag if @asset_tag
	end

	def self.search(query)
		where("name like ?", "%#{query}%") 
	end

end
