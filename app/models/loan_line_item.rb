class LoanLineItem < ActiveRecord::Base
	belongs_to :loan
	belongs_to :loanable, :polymorphic => true
	after_create :loan_items
	before_destroy :receive_items

	def loan_items
		if loanable_type == 'Device'
			loanable.loaned = true
			loanable.save
		end
		if loanable_type == 'InventoryItem'
			loanable.on_hand_quantity -= quantity.to_i
			loanable.loaned_out_quantity += quantity.to_i
			loanable.save
		end
	end

	def receive_items
		if loanable_type == 'Device'
			loanable.loaned = false
			loanable.save
		end
		if loanable_type == 'InventoryItem'
			loanable.on_hand_quantity += quantity.to_i
			loanable.loaned_out_quantity -= quantity.to_i
			loanable.save
		end
	end
end
