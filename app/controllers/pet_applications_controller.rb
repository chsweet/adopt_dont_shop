class PetApplicationsController < ApplicationController
  def update
    application = Application.find(params[:app_id])
    pet_application = PetApplication.find_pet_application(params[:pet_id], params[:app_id])

    if params[:approved]
      pet_application.update(status: params[:approved])
      redirect_to "/admin/applications/#{application.id}"
    end
  end
end
