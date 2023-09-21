require 'rails_helper'

RSpec.describe Label, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    label = Label.new(name: 'Sample Label', user:)
    expect(label).to be_valid
  end

  it 'is not valid without a name' do
    label = Label.new
    expect(label).to_not be_valid
  end
end
