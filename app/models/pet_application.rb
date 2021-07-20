class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  def self.find_pet_application(pet_id, app_id)
    where(pet_id: pet_id).where(application_id: app_id).first
  end
end
