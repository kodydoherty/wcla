class AddUrlToDocs < ActiveRecord::Migration
  def change
  	add_column :docs, :url, :string
  end
end
