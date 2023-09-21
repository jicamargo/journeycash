def create_sample_data
  let!(:user) do
    User.create(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password'
    )
  end

  let!(:label) do
    Label.create(
      name: 'Sample Label',
      user:
    )
  end

  let!(:group) do
    Group.create(
      name: 'Sample Group',
      icon: 'cat01.png',
      user:
    )
  end

  let!(:payment) do
    Payment.create(
      amount: 100.0,
      label:,
      group:
    )
  end
end

def login(email, password)
  visit '/users/sign_in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end
