class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  def self.pet_app_approved?(id)
    
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
