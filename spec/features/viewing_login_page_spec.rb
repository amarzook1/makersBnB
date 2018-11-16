feature 'Viewing Makersbnb login page' do
  scenario 'visiting login page' do
    setup_test_database
    visit('/login')
    expect(page).to have_content "Log in"
    expect(page).to have_content "Sign up"
  end
end
