require 'rails_helper'

RSpec.describe Payment, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    group = Group.new(name: 'Sample Group', icon: 'cat01.png', user:)
    label = Label.new(name: 'Sample Label', user:)
    payment = Payment.new(amount: 100.0, label:, group:)

    expect(payment).to be_valid
  end

  it 'is not valid without an amount' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    group = Group.new(name: 'Sample Group', icon: 'cat01.png', user:)
    label = Label.new(name: 'Sample Label', user:)
    payment = Payment.new(label:, group:)

    expect(payment).to_not be_valid
  end
end
