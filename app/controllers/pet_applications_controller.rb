class PetApplicationsController < ApplicationController
  def update
    application = Application.find(params[:app_id])
    pet_app = PetApplication.find_by(application_id: params[:app_id], pet_id: params[:pet_id])

    pet_app.update(status: params[:status])

    # if PetApplication.pet_app_approved?(pet_app.id) == true
    #   application.update(status: "Approved")
    # end

    redirect_to "/admin/applications/#{application.id}"
  end
end
