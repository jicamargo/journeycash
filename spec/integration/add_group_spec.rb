require 'rails_helper'
require './spec/test_helper'

RSpec.describe 'New Category', type: :system do
  # Create sample data, including a user
  create_sample_data

  it 'allows creating a new category' do
    login(user.email, user.password)
    sleep 1

    # Navigate to the new category creation page
    visit new_group_path

    # Fill out the new category form
    fill_in "Category's name", with: 'New Category' 
    
    click_button 'Save changes'

    sleep 1

    # Verify the the app returns to the groups page and the new transaction is displayed
    expect(current_path).to eq(groups_path)
    expect(page).to have_content("New Category")

    sleep 1
    
  end
end
