class CreateLoanLineItems < ActiveRecord::Migration
  def change
    create_table :loan_line_items do |t|
      t.string :identifier
      t.text :description
      t.integer :quantity
      t.boolean :returned
      t.integer :loan_id
      t.integer :loanable_id
      t.string :loanable_type
      t.boolean :returned

      t.timestamps
    end
  end
end
