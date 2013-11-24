class AddDocTypeIdToDocs < ActiveRecord::Migration
  def change
  	add_column :docs, :doc_type_id, :integer
  end
end
