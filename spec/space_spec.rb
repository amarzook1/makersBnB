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
      x = Space.create(name: 'xt_name', description: 'xt_description', price: '1100')
      expect(Space.get_name).to include('xt_name')
      expect(Space.get_description).to include('xt_description')
      expect(Space.get_price).to include('1100')
      setup_test_database
    end
  end
  describe '#update' do
    it 'updates the availability' do
      Space.update
      expect(Space.get_availability).to include('f')
      setup_test_database
    end
  end
  describe '#get' do
    it 'get_name gets the name' do
      expect(Space.get_name).to include('t_name')
    end
    it 'get_desc gets the desc' do
      expect(Space.get_description).to include('t_description')
    end
    it 'get_price gets the price' do
      expect(Space.get_price).to include('100')
    end
    it 'get_availability gets the availability' do
      expect(Space.get_availability).to include('t')
    end
  end
end
