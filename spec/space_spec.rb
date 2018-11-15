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
      expect(User.space_table).to include('t_name')
    end
  end
end
