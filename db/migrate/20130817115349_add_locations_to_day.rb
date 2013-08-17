class AddLocationsToDay < ActiveRecord::Migration
  def change
    add_column(:days, :start_location, :string)
    add_column(:days, :end_location, :string)
  end
end
