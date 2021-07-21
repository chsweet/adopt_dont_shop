class PetApplicationsController < ApplicationController
  def update
    application = Application.find(params[:app_id])
    pet_application = PetApplication.find_pet_application(params[:pet_id], params[:app_id])

    pet_application.update(status: params[:status])

    if pet_app_status? == true
      application.update(status: "Approved")
    end

    redirect_to "/admin/applications/#{application.id}"
  end

 #should this be in the pet_application model?
  def pet_app_status?
    application = Application.find(params[:app_id])

    application.pet_applications.all? do |pet_app|
      pet_app.status == "Approved"
    end
  end
end
