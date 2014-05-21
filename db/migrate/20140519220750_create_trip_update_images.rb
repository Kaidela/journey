class CreateTripUpdateImages < ActiveRecord::Migration
  def change
    create_table :trip_update_images do |t|
      t.string :file
      t.references :trip_update, index: true

      t.timestamps
    end
  end
end
