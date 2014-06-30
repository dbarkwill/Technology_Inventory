class Relatible < ActiveRecord::Base
	belongs_to :article
	belongs_to :target, :polymorphic => true
end
