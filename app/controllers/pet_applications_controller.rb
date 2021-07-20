class PetApplicationsController < ApplicationController
  def update
    application = Application.find(params[:app_id])
    pet_application = PetApplication.find_pet_application(params[:pet_id], params[:app_id])
    pet_application.update(status: params[:status])
    redirect_to "/admin/applications/#{application.id}"
  end
end
