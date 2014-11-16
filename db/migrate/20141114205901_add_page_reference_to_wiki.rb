class AddPageReferenceToWiki < ActiveRecord::Migration
  def change
    add_column :wikis, :page_reference, :string
  end
end
