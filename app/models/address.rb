class Address < ActiveRecord::Base
	belongs_to :network
	belongs_to :device, :polymorphic => true
end
