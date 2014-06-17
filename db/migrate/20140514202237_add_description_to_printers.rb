class AddDescriptionToPrinters < ActiveRecord::Migration
  def change
    add_column :printers, :description, :text
  end
end
