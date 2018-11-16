require 'user'

feature 'Signing up' do
  scenario 'trying to sign up to Makersbnb' do
    setup_test_database
    visit('/login')
    fill_in('Password', with: '1234')
    fill_in('Email', with: 'testemail@email.com')
    click_button('Sign up')

    fill_in('Password ', with: '1234')
    fill_in('Email ', with: 'testemail@email.com')
    click_button('Log in')

    expect(page).to have_content "This is the home page"
  end
end
