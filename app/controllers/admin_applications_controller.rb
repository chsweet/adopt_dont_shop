class AdminApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:app_id])
    @pets = @application.pets
    @pet_applications = PetApplication.all
  end 
end
