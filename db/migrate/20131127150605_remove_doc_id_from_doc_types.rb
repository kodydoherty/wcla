class RemoveDocIdFromDocTypes < ActiveRecord::Migration
  def change
  	remove_column :doc_types, :doc_id
  end
end
