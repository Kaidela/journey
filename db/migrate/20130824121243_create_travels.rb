class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
    	t.datetime :departure
      t.datetime :arrival
      t.string :number
      t.string :mode
      t.string :stopover
      t.timestamps
    end

    add_column :days, :travel_id, :integer
  end
end
