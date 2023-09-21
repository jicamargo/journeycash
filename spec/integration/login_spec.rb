require 'rails_helper'
require './spec/test_helper'

RSpec.describe 'Login', type: :system do
  create_sample_data

  describe 'the signin process', type: :feature do
    it "signs not me in, because I don't have a valid email" do
      login('wrong@example.com', 'badpassword')
      expect(page).to have_content 'Invalid'
    end

    it 'signs me in' do
      login(user.email, user.password)
      expect(page).to have_content 'Journey Cash' # Name of the app at the top (navbar)
    end
  end
end
