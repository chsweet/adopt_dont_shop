require 'rails_helper'

RSpec.describe 'the applications show' do
  before :each do
    @shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    @pet_1 = Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: @shelter.id)
    @pet_2 = Pet.create!(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: @shelter.id)
    @pet_3 = Pet.create!(adoptable: true, age: 4, breed: 'chihuahua', name: 'Elle', shelter_id: @shelter.id)
    @pet_4 = Pet.create!(adoptable: true, age: 1, breed: 'retriever/mix', name: 'Miley', shelter_id: @shelter.id)
    @pet_5 = Pet.create!(adoptable: true, age: 10, breed: 'great dane', name: 'Bear', shelter_id: @shelter.id)
    @pet_6 = Pet.create!(adoptable: true, age: 3, breed: 'lab', name: 'Bearington', shelter_id: @shelter.id)

    @application_1 = Application.create!(name: 'Ashley', address: '1215 Perrine', city: 'Rawlins', state: 'WY', zip_code: 82301, description: 'I want a puppy', status: 'In Progress')
    @application_2 = Application.create!(name: 'Sarah', address: '8734 Drive Dr', city: 'Denver', state: 'CO', zip_code: 80221, description: 'I love dogs!', status: 'In Progress')


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
    expect(page).to_not have_content("#{@pet_1.name}")
    find_link("#{@pet_2.name}")
    find_link("#{@pet_3.name}")
    expect(page).to have_content("Application Status: #{@application_1.status}")
  end
  #User story 3
  it 'had link to pet show page from pet name' do
    visit "/applications/#{@application_1.id}"

    click_link "Lobster"

    expect(current_path).to eq("/pets/#{@pet_2.id}")
  end
  #User story 6
  it 'has a text box to filter results by keyword' do
    visit "/applications/#{@application_1.id}"

    expect(page).to have_button("Search")
  end
  #User story 6 & 10
  it 'lists partial matches of search results' do
    visit "/applications/#{@application_1.id}"

    fill_in 'Search by pet name:', with: "Lucille"
    click_on("Search")

    expect(current_path).to eq("/applications/#{@application_1.id}")
    expect(@pet_1.name).to appear_before(@pet_3.name)
  end
  #User story 9
  it 'does not display "Submit Application" button when no pets are on the application' do
    visit "/applications/#{@application_2.id}"

    expect(page).to_not have_button("Submit Application")
  end
  #User story 10 & 11
  it 'search results list partial matches and is case insensitive' do
    visit "/applications/#{@application_1.id}"

    fill_in 'Search by pet name:', with: "bear"
    click_on("Search")
    save_and_open_page
    expect(current_path).to eq("/applications/#{@application_1.id}")
    expect(page).to have_content(@pet_5.name)
    expect(page).to have_content(@pet_6.name)
  end
end
