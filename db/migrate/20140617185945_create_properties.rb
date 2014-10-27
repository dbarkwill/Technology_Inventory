class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :style
      t.string :unit
      t.string :fa_style
      t.text :values
      t.timestamps
    end
  end
end
