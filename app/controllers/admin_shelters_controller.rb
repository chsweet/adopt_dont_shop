class AdminSheltersController < ApplicationController
  def index
    @ordered_shelters = Shelter.order_alphabetical
  end
end
