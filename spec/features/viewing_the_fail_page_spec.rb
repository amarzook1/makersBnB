feature 'Viewing the fail page' do
  scenario 'visiting fail page' do
    setup_test_database
    visit('/login')
    fill_in('Email ', with: 'test')
    fill_in('Password ', with: '1234')
    click_button('Log in')
    expect(page).to have_content "failure"
  end
end
