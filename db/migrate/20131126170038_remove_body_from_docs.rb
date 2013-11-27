class RemoveBodyFromDocs < ActiveRecord::Migration
  def change
  	remove_column :docs, :body
  end
end
