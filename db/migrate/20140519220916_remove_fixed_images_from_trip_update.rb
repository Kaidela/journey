class RemoveFixedImagesFromTripUpdate < ActiveRecord::Migration
  def change
    remove_column :trip_updates, :image_1
    remove_column :trip_updates, :image_2
    remove_column :trip_updates, :image_3
  end
end
