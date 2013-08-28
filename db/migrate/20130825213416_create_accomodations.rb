class CreateAccomodations < ActiveRecord::Migration
  def change
    create_table :accomodations do |t|
   		t.datetime :departure
      t.datetime :arrival
      t.string :name
      t.timestamps
    end

    add_column :days, :accomodation_id, :integer
  end
end
