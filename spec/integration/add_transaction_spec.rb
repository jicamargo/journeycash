require 'rails_helper'
require './spec/test_helper'

RSpec.describe 'New Transaction', type: :system do
  # Create sample data, including a group
  create_sample_data

  it 'allows creating a new transaction' do
    login(user.email, user.password)
    sleep 1

    # Navigate to the new transaction creation page
    visit new_group_payment_path(group)

    sleep 1
    # write "sample label" in the field with id "new_label"
    fill_in 'payment_new_label', with: 'New label'


    # Fill out the new transaction form
    fill_in 'Amount', with: 50.0 
    # select label.name, from: 'Label'
    click_button 'Save transaction'

    sleep 1
    
    # Verify the the app returns to the group page and the new transaction is displayed
    expect(current_path).to eq(group_path(group))
    expect(page).to have_content("50.00")
    expect(page).to have_content("New label")   
  end
end
