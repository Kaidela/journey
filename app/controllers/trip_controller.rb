class TripController < ApplicationController
  def index
    @days = Day.all.order(:date)
  end
end
