require 'rails_helper'

RSpec.describe 'the applications updates' do
  before :each do
    @shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    @pet_1 = Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: @shelter.id)
    @pet_2 = Pet.create!(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: @shelter.id)
    @pet_3 = Pet.create!(adoptable: true, age: 4, breed: 'chihuahua', name: 'Elle', shelter_id: @shelter.id)
    @pet_4 = Pet.create!(adoptable: true, age: 1, breed: 'retriever/mix', name: 'Miley', shelter_id: @shelter.id)


    @application_1 = Application.create!(name: 'Ashley', address: '1215 Perrine', city: 'Rawlins', state: 'WY', zip_code: 82301, description: 'I want a puppy', status: 'In Progress')

    PetApplication.create!(pet: @pet_2, application: @application_1)
    PetApplication.create!(pet: @pet_3, application: @application_1)
  end

  it 'displays button next to searched pets' do
    visit "/applications/#{@application_1.id}"

    fill_in 'Search by pet name:', with: "Miley"
    click_on("Search")

    expect(page).to have_button("Adopt this Pet")
  end

  it 'add pet to pets list on the application when button selected' do
    visit "/applications/#{@application_1.id}"

    fill_in 'Search by pet name:', with: "Miley"
    click_on("Search")

    within("#searched_pets-#{@pet_4.id}") do
      click_button('Adopt this Pet')
    end

    expect(current_path).to eq("/applications/#{@application_1.id}")
    find_link("#{@pet_4.name}")
  end

  it 'displays a "Submit Application" button when application has pets' do
    visit "/applications/#{@application_1.id}"

    expect(page).to have_button("Submit Application")
  end

  it 'updates application to "Pending" when the "Submit Application" is pushed' do
    visit "/applications/#{@application_1.id}"

    click_button('Submit Application')

    expect(current_path).to eq("/applications/#{@application_1.id}")
    expect(page).to have_content("Application Status: Pending")
  end

end
