class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])

    if params[:search].present?
      @searched_pets = Pet.search(params[:search])
    else
      @searched_pets = []
    end
  end

  def new
  end

  def create
    application = Application.new(application_params)

    if application.save
      redirect_to "/applications/#{application.id}"
    else
      redirect_to '/applications/new'
      flash[:alert] = "Error: #{error_message(application.errors)}"
    end
  end

  def update
    application = Application.find(params[:id])

    if params[:pet_id]
      pet = Pet.find(params[:pet_id])
      PetApplication.create(pet: pet, application: application)
      redirect_to "/applications/#{application.id}"
    elsif params[:status]
      application.update(description: params[:description])
      application.update(status: params[:status])
      redirect_to "/applications/#{application.id}"
    end
  end

private
  def application_params
    params.permit(:name, :address, :city, :state, :zip_code, :description, :status)
  end
end
