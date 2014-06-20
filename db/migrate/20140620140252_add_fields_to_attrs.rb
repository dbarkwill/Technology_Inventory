class AddFieldsToAttrs < ActiveRecord::Migration
  def change
    add_column :attrs, :type, :string
    add_column :attrs, :values, :string
    add_column :attrs, :unit, :string
  end
end
