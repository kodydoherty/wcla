class RemoveSlugFromCategories < ActiveRecord::Migration
  def change
  	remove_column :categories, :slug
  end
end
