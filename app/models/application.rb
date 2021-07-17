class Application < ApplicationRecord
  # validates :name, presence: true
  # validates :age, presence: true, numericality: true
  has_many :pet_applications
end
