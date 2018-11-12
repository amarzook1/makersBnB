feature 'Viewing Makersbnb login page' do
  scenario 'visiting login page' do
    setup_test_database
    visit('/login')
    expect(page).to have_content "This is the login page"
  end
end
