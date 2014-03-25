class TripController < ApplicationController
  def index
    @days = Day.all
  end
end
