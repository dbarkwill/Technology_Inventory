class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :asset_tag
      t.text :notes

      t.timestamps
    end
  end
end
