require 'rails_helper'

RSpec.describe 'the applications show' do
  before :each do
    @shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    @pet_1 = Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: @shelter.id)
    @pet_2 = Pet.create!(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: @shelter.id)
    @pet_3 = Pet.create!(adoptable: true, age: 4, breed: 'chihuahua', name: 'Elle', shelter_id: @shelter.id)

    @application_1 = Application.create!(name: 'Ashley', address: '1215 Perrine', city: 'Rawlins', state: 'WY', zip_code: 82301, description: 'I want a puppy', status: 'In Progress')

    PetApplication.create!(pet: @pet_2, application: @application_1)
    PetApplication.create!(pet: @pet_3, application: @application_1)
  end

  it 'displays the applicant with all attributes and pet names' do
    visit "/applications/#{@application_1.id}"

    expect(page).to have_content("#{@application_1.name}")
    expect(page).to have_content("Address: #{@application_1.address}")
    expect(page).to have_content("City: #{@application_1.city}")
    expect(page).to have_content("State: #{@application_1.state}")
    expect(page).to have_content("Zip Code: #{@application_1.zip_code}")
    expect(page).to have_content("Description: #{@application_1.description}")
    expect(page).to_not have_content("Pet(s): #{@pet_1.name}")
    expect(page).to have_content("Pet(s): #{@pet_2.name}")
    expect(page).to have_content("Pet(s): #{@pet_3.name}")
    expect(page).to have_content("Application Status: #{@application_1.status}")
  end

  it 'had link to pet show page from pet name' do
    visit "/applications/#{@application_1.id}"

    click_link "Lobster"

    expect(current_path).to eq("/pets/#{@pet_2.id}")
  end
end
