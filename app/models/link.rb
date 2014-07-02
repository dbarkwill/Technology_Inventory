class Link < ActiveRecord::Base
	belongs_to :article
	belongs_to :linkable, :polymorphic => true
end
