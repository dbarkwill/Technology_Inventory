class Loan < ActiveRecord::Base
	has_many :loan_line_items, dependent: :destroy
	accepts_nested_attributes_for :loan_line_items, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
end
