class AddFieldsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :published, :boolean
    add_column :articles, :front_page, :boolean
  end
end
