class AddFieldsToAttrs < ActiveRecord::Migration
  def change
    add_column :attrs, :style, :string
    add_column :attrs, :values, :text
    add_column :attrs, :unit, :string
  end
end
