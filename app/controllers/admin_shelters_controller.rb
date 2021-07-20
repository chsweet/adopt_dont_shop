class AdminSheltersController < ApplicationController
  def index
    @ordered_shelters = Shelter.order_desc_by_name
    @shelters_with_pending_applications = Shelter.pending_applications
  end
end
