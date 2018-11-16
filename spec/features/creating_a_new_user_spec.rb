require 'user'

feature 'Signing up' do
  scenario 'trying to sign up to Makersbnb' do
    setup_test_database
    visit('/login')
    fill_in('Password', with: '1234')
    fill_in('Email', with: 'testemail@email.com')
    click_button('Sign up')

    expect(User.password_list).to include '1234'
    expect(User.email_list).to include 'testemail@email.com'

    expect(page).to have_content('Log in')
    expect(page).to have_content('Sign up')

  end
end
