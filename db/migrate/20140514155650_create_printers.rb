class CreatePrinters < ActiveRecord::Migration
  def change
    create_table :printers do |t|
      t.string :name
      t.string :namufacturer
      t.string :model
      t.string :MAC
      t.string :location
      t.string :print_queue

      t.timestamps
    end
  end
end
