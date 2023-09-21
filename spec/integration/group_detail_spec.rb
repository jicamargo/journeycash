require 'rails_helper'
require './spec/test_helper'

RSpec.describe 'Group Show', type: :system do
  create_sample_data

  it 'displays group information and associated payments' do
    login(user.email, user.password)
    sleep 1
    visit group_path(group)
    sleep 1
    expect(page).to have_content(group.name)

    expect(page).to have_content('100.00')

    group.payments.each do |payment|
      expect(page).to have_content(payment.label.name)
    end

    expect(page).to have_link('Add transaction', href: new_group_payment_path(group))
    expect(page).to have_link('< Back', href: groups_path)
  end
end
