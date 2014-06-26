class CreateCheckoutHistories < ActiveRecord::Migration
  def change
    create_table :checkout_histories do |t|
      t.integer :device_id
      t.string :name
      t.text :notes
      t.boolean :checked_in

      t.timestamps
    end
  end
end
