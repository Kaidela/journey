class AddTripUpdateToDayTable < ActiveRecord::Migration
  def change
  	add_column :days, :trip_update_id, :integer
  end
end
