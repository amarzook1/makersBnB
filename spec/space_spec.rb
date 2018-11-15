require 'space'
require 'user'

describe Space do
  before do
    setup_test_database
    User.sign_up(su_password: 'fake_pass', su_email: 'fake_email@hi.com')
    User.log_in(li_email: 'fake_email@hi.com', li_password: 'fake_pass')
    Space.create(name: 't_name', description: 't_description', price: '100')
  end
  describe '#create' do
    it 'creates a new space' do
      setup_test_database
      x = Space.create(name: 't_name', description: 't_description', price: '100')
      expect(Space.get_name).to include('t_name')
      expect(Space.get_description).to include('t_description')
      expect(Space.get_price).to include('100')
    end
  end
  describe '#update' do
    it 'updates the listing so availability equals false' do
      x = Space.update
      expect(x).to include(true)
    end
  end
end
