class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :article_id
      t.integer :linkable_id
      t.string :linkable_type

      t.timestamps
    end
  end
end
