class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :page_name
      t.text :contents
      t.integer :user_id

      t.timestamps
    end
  end
end
