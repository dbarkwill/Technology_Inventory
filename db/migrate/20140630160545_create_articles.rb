class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.text :summary
      t.text :content
      t.boolean :published
      t.boolean :front_page

      t.timestamps
    end
  end
end
