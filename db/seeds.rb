# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PetApplication.destroy_all
Application.destroy_all
Pet.destroy_all
Shelter.destroy_all 
#shelters
@shelter_1 = Shelter.create(name: 'Denver Dumb Friends Leauge', city: 'Denver, CO', foster_program: true, rank: 8)
@shelter_2 = Shelter.create(name: 'Rocky Mountain Puppy Rescue', city: 'Westminster, CO', foster_program: true, rank: 9)

#pets
@pet_1 = Pet.create!(adoptable: true, age: 7, breed: 'dane-shepard', name: 'Koop', shelter_id: @shelter_2.id)
@pet_2 = Pet.create!(adoptable: true, age: 9, breed: 'pitbull', name: 'Nola', shelter_id: @shelter_1.id)
@pet_3 = Pet.create!(adoptable: true, age: 6, breed: 'lab', name: 'Mona', shelter_id: @shelter_1.id)
@pet_4 = Pet.create!(adoptable: true, age: 1, breed: 'retriever/mix', name: 'Miley', shelter_id: @shelter_2.id)
@pet_5 = Pet.create!(adoptable: true, age: 3, breed: 'saint bernard', name: 'Truck', shelter_id: @shelter_2.id)
@pet_6 = Pet.create!(adoptable: true, age: 4, breed: 'australian shepard', name: 'Jackson', shelter_id: @shelter_2.id)

#applications
@application_1 = Application.create!(name: 'Isabella', address: '1234 Drive', city: 'Denver', state: 'CO', zip_code: 80221, description: 'I want a friend', status: 'In Progress')
@application_2 = Application.create!(name: 'Molly', address: '6831 ', city: 'Aurora', state: 'CO', zip_code: 80023, description: 'My other dog wants a friend', status: 'Approved')
@application_3 = Application.create!(name: 'Fiona', address: '1215 Perrine', city: 'Rawlins', state: 'WY', zip_code: 82301, description: 'I want a puppy', status: 'In Progress')
@application_4 = Application.create!(name: 'Felipe', address: '6835 Carrick Dr', city: 'Fort Collins', state: 'CO', zip_code: 80525, description: 'I would be the best dog parent!', status: 'Pending')
@application_5 = Application.create!(name: 'Bailey', address: '2323 Platte Street', city: 'Saratoga', state: 'WY', zip_code: 82311, description: 'I want a puppy', status: 'Pending')

#pet_applications
PetApplication.create!(pet: @pet_2, application: @application_1)
PetApplication.create!(pet: @pet_3, application: @application_1)
PetApplication.create!(pet: @pet_5, application: @application_1)
PetApplication.create!(pet: @pet_2, application: @application_2)
PetApplication.create!(pet: @pet_3, application: @application_2)
PetApplication.create!(pet: @pet_4, application: @application_2)
PetApplication.create!(pet: @pet_4, application: @application_3)
PetApplication.create!(pet: @pet_6, application: @application_3)
PetApplication.create!(pet: @pet_1, application: @application_4)
PetApplication.create!(pet: @pet_3, application: @application_4)
PetApplication.create!(pet: @pet_5, application: @application_4)
PetApplication.create!(pet: @pet_6, application: @application_5)
