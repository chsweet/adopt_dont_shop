class PetApplicationsController < ApplicationController
  def update
    application = Application.find(params[:app_id])
    pet_application = application.pet_applications.find_by(application_id: params[:app_id], pet_id: params[:pet_id])

    pet_application.update(status: params[:status])

    # if pet_app_approved? == true
    #   application.update(status: "Approved")
    # end

    redirect_to "/admin/applications/#{application.id}"
  end

 #should this be in the pet_application model?
  # def pet_app_approved?
  #   application = Application.find(params[:app_id])
  #
  #   application.pet_applications.all? do |pet_app|
  #     pet_app.status == "Approved"
  #   end
  # end
end
