class WelcomeController < ApplicationController
  def index
    @days = Day.all
  end
end
