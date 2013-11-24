class CreateDocType < ActiveRecord::Migration
  def change
    create_table :doc_types do |t|
      t.string :name
      t.integer :doc_id
      t.timestamps
    end
  end
end
