feature 'Viewing the fail page' do
  scenario 'visiting fail page' do
    setup_test_database
    visit('/login')
    fill_in('Email', with: 'ur mum lol')
    fill_in('Password', with: '1234')
    click_button('Submit')
    expect(page).to have_content "failure"
  end
end
