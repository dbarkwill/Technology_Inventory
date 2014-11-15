class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :extension
      t.string :direct_dial
      t.string :cell
      t.string :email

      t.timestamps
    end
  end
end
