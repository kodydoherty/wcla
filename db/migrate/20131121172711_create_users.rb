class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :slug
      t.string :role
      t.integer :unit
      t.timestamps
    end
  end
end
