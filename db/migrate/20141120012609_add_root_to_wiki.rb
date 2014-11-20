class AddRootToWiki < ActiveRecord::Migration
  def change
    add_column :wikis, :root, :boolean
  end
end
