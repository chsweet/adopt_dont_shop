class PetApplication < ApplicationRecord
  # validates :name, presence: true
  # validates :age, presence: true, numericality: true
  belongs_to :pet
  belongs_to :application

end
