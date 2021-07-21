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
@shelter_3 = Shelter.create(name: 'Black Dog Animal Resuce', city: 'Cheyenne, WY', foster_program: true, rank: 7)
@shelter_4 = Shelter.create(name: 'Animal Friends Alliance', city: 'Fort Collins, CO', foster_program: true, rank: 8)

#pets
@pet_1 = Pet.create!(adoptable: true, age: 7, breed: 'Dane-Shepard', name: 'Koop', shelter_id: @shelter_2.id)
@pet_2 = Pet.create!(adoptable: false, age: 9, breed: 'Pitbull', name: 'Nola', shelter_id: @shelter_1.id)
@pet_3 = Pet.create!(adoptable: true, age: 6, breed: 'Lab', name: 'Mona', shelter_id: @shelter_1.id)
@pet_4 = Pet.create!(adoptable: true, age: 1, breed: 'retriever/mix', name: 'Miley', shelter_id: @shelter_2.id)
@pet_5 = Pet.create!(adoptable: false, age: 3, breed: 'Saint Bernard', name: 'Truck', shelter_id: @shelter_3.id)
@pet_6 = Pet.create!(adoptable: true, age: 4, breed: 'Australian Shepard', name: 'Jackson', shelter_id: @shelter_3.id)
@pet_7 = Pet.create!(adoptable: true, age: 2, breed: 'Shih Tzu', name: 'Baxter', shelter_id: @shelter_4.id)
@pet_8 = Pet.create!(adoptable: false, age: 3, breed: 'Lab', name: 'Luke', shelter_id: @shelter_4.id)
@pet_9 = Pet.create!(adoptable: true, age: 1, breed: 'Australian Shepard', name: 'Mo', shelter_id: @shelter_4.id)

#applications
@application_1 = Application.create!(name: 'Isabella', address: '1234 Drive', city: 'Denver', state: 'CO', zip_code: 80221, status: 'In Progress')
@application_2 = Application.create!(name: 'Molly', address: '6831 Drive Dr', city: 'Aurora', state: 'CO', zip_code: 80023, status: 'In Progress')
@application_3 = Application.create!(name: 'Fiona', address: '1215 Harshman', city: 'Rawlins', state: 'WY', zip_code: 82301, status: 'In Progress')
@application_4 = Application.create!(name: 'Felipe', address: '6835 Carrick Dr', city: 'Fort Collins', state: 'CO', zip_code: 80525, status: 'In Progress')
@application_5 = Application.create!(name: 'Bailey', address: '2323 Platte Street', city: 'Saratoga', state: 'WY', zip_code: 82311, status: 'In Progress')

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
