require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    group = Group.new(name: 'Sample Group', icon: 'sample_icon', user:)
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group = Group.new(icon: 'sample_icon')
    expect(group).to_not be_valid
  end

  it 'is not valid without an icon' do
    group = Group.new(name: 'Sample Group')
    expect(group).to_not be_valid
  end
end
