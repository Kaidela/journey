class CreateTripUpdates < ActiveRecord::Migration
  def change
    create_table :trip_updates do |t|
    	t.date :day
    	t.string :doing
    	t.string :eating
    	t.string :highlights
    	t.string :image_1
    	t.string :image_2
    	t.string :image_3
      t.timestamps
    end
  end
end
