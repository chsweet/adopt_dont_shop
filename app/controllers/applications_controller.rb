class ApplicationsController < ApplicationController

  def index
  end

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

private
  def application_params
    params.permit(:name, :address, :city, :state, :zip_code, :description, :status)
  end
end
