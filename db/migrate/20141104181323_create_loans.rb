class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.string :loanee
      t.string :notes
      t.boolean :closed

      t.timestamps
    end
  end
end
