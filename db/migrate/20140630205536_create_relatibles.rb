class CreateRelatibles < ActiveRecord::Migration
  def change
    create_table :relatibles do |t|
      t.integer :article_id
      t.integer :target_id
      t.string :target_type

      t.timestamps
    end
  end
end
