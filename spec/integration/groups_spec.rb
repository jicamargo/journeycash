require 'rails_helper'
require './spec/test_helper'

RSpec.describe 'Groups', type: :system do
  create_sample_data

  it 'displays a list of categories with their icons and total amounts' do
    login(user.email, user.password)

    sleep 1

    expect(page).to have_content('Categories')

    expect(page).to have_selector('.group-card', count: Group.count)

    Group.all.each do |group|
      expect(page).to have_content(group.name)

      expect(page).to have_content('$100.00')
    end
  end

  it 'redirects to the new group page when "New Category" is clicked' do
    login(user.email, user.password)

    expect(page).to have_selector('.format-btn-submit')
    find('a.format-btn-submit', text: 'New Category', wait: 10).click

    sleep 1
    expect(current_path).to eq(new_group_path)
  end
end
