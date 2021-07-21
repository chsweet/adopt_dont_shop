require 'rails_helper'

RSpec.describe 'application creation' do
  before :each do
    @shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    @pet_1 = Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: @shelter.id)
    @pet_2 = Pet.create!(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: @shelter.id)
    @pet_3 = Pet.create!(adoptable: true, age: 4, breed: 'chihuahua', name: 'Elle', shelter_id: @shelter.id)
  end

  describe 'new application' do
    #User story 4
    it 'links to the new page from the pet index page' do
      visit '/pets'

      click_link 'Start an Application'

      expect(current_path).to eq('/applications/new')
    end
    #User story 4
    it 'can create a new application when all fields are filled out' do
      visit '/applications/new'

      fill_in 'Name', with: 'Ciara'
      fill_in 'Address', with: '6831 39th Street'
      fill_in 'City', with: 'Denver'
      fill_in 'State', with: 'CO'
      fill_in 'Zip Code', with: 80223

      click_button 'Submit Application'


      @application = Application.last

      expect(current_path).to eq("/applications/#{@application.id}")
      expect(page).to have_content("Ciara")
      expect(page).to have_content("Address: 6831 39th Street Denver, CO 80223")
      expect(page).to have_content("Application Status: In Progress")
    end
  end
  #User story 5
  describe 'not all fields are filled out' do
    it 're-renders the new form' do
      visit '/applications/new'

      fill_in 'Name', with: 'Ciara'
      fill_in 'Address', with: '6831 39th Street'
      fill_in 'Zip Code', with: 80223

      click_button 'Submit Application'

      expect(page).to have_current_path('/applications/new')
      expect(page).to have_content("Error: City can't be blank, State can't be blank")
    end
  end

end
