class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :file
      t.string :uploadable_type
      t.integer :uploadable_id
      t.string :name

      t.timestamps
    end
  end
end
