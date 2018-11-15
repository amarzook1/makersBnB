require 'user'

describe User do
  before do
    setup_test_database
    User.sign_up(su_password: 'fake_pass', su_email: 'fake_email@hi.com')
  end
  describe '#sign_up' do
    it 'signs the user up and adds to the database' do
      expect(User.email_list).to include('fake_email@hi.com')
      expect(User.password_list).to include('fake_pass')
      setup_test_database
    end
    describe '#log_in' do
      it 'logs the user in' do
        x = (User.log_in(li_email: 'fake_email@hi.com', li_password: 'fake_pass'))
        expect(x).to eql(true)
      end
      it 'fails to log in the user' do
        x = (User.log_in(li_email: 'ake_email@hi.com', li_password: 'ake_pass'))
        expect(x).to eql(false)
      end
      setup_test_database
    end
    describe '#password_list' do
      it 'puts a list of passwords in an array' do
        User.sign_up(su_password: 'fake_pass2', su_email: 'fake_email@hi.com2')
        User.sign_up(su_password: 'fake_pass3', su_email: 'fake_email@hi.com3')
        x = User.password_list
        expect(x).to include('fake_pass')
        expect(x).to include('fake_pass2')
        expect(x).to include('fake_pass3')
        setup_test_database
      end
    end
    describe '#email_list' do
      it 'puts a list of passwords in an array' do
        User.sign_up(su_password: 'fake_pass2', su_email: 'fake_email@hi.com2')
        User.sign_up(su_password: 'fake_pass3', su_email: 'fake_email@hi.com3')
        x = User.email_list
        expect(x).to include('fake_email@hi.com')
        expect(x).to include('fake_email@hi.com2')
        expect(x).to include('fake_email@hi.com3')
        setup_test_database
      end
    end
  end
end
