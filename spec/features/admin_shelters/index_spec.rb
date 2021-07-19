require 'rails_helper'

RSpec.describe 'the admin shelters index' do
  before :each do
    @shelter_3 = Shelter.create(name: 'All Dogs Need Homes', city: 'Rapid City, SD', foster_program: true, rank: 9)
    @shelter_2 = Shelter.create(name: 'Dane Rescue', city: 'Denver CO', foster_program: false, rank: 9)
    @shelter_1 = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: true, rank: 9)


    @pet_1 = Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: @shelter_1.id)
    @pet_2 = Pet.create!(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: @shelter_1.id)
    @pet_3 = Pet.create!(adoptable: true, age: 4, breed: 'chihuahua', name: 'Elle', shelter_id: @shelter_2.id)
    @pet_4 = Pet.create!(adoptable: true, age: 1, breed: 'retriever/mix', name: 'Miley', shelter_id: @shelter_3.id)


    @application_1 = Application.create!(name: 'Ashley', address: '1215 Perrine', city: 'Rawlins', state: 'WY', zip_code: 82301, description: 'I will be the best pet parent', status: 'Pending')
    @application_2 = Application.create!(name: 'Sarah', address: '8356 Drive Dr', city: 'Denver', state: 'CO', zip_code: 80203, status: 'In Progress')
    @application_3 = Application.create!(name: 'Mona', address: '7230 Chipper Ln', city: 'Loveland', state: 'CO', zip_code: 80232, description: 'I love dog!!', status: 'Pending')
    @application_4 = Application.create!(name: 'Sarah', address: '8356 Drive Dr', city: 'Denver', state: 'CO', zip_code: 80203, description: 'I will take the pup on lots of adventures', status: 'Pending')

    PetApplication.create!(pet: @pet_1, application: @application_1)
    PetApplication.create!(pet: @pet_2, application: @application_1)
    PetApplication.create!(pet: @pet_4, application: @application_2)
    PetApplication.create!(pet: @pet_2, application: @application_3)
    PetApplication.create!(pet: @pet_1, application: @application_4)
    PetApplication.create!(pet: @pet_4, application: @application_4)
  end

  it 'displays all shelters in reverse alphabetical order by name' do
    visit '/admin/shelters'
    @shelter_3 = Shelter.create(name: 'All Dogs Need Homes', city: 'Rapid City, SD', foster_program: true, rank: 9)
    @shelter_2 = Shelter.create(name: 'Dane Rescue', city: 'Denver CO', foster_program: false, rank: 9)
    @shelter_1 = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: true, rank: 9)

    expect(@shelter_1.name).to appear_before(@shelter_3.name)
    expect(@shelter_2.name).to_not appear_before(@shelter_1.name)
    expect(@shelter_3.name).to_not appear_before(@shelter_2.name)
  end

end
