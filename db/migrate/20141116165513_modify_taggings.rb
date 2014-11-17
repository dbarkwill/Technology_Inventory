class ModifyTaggings < ActiveRecord::Migration
  def change
    add_column :taggings, :wiki_id, :string
    remove_column :taggings, :article_id
  end
end
