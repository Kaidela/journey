class DayController < ApplicationController
  def show
    @day = Day.find(params[:id])
  end
end
