class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :body
      t.integer :day_id

      t.timestamps
    end
  	add_index :comments, :day_id
  end
end
