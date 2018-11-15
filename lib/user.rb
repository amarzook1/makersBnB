require 'pg'

class User

  def self.sign_up(su_password:, su_email:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Makersbnb_test')
    else
      connection = PG.connect(dbname: 'Makersbnb')
    end
    query = "INSERT INTO users (email, password) VALUES('#{su_email}', '#{su_password}') RETURNING email, password;"
    connection.exec(query)
  end

  def self.log_in(li_email:, li_password:)
    @li_email = li_email
    @li_password = li_password
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Makersbnb_test')
    else
      connection = PG.connect(dbname: 'Makersbnb')
    end
    query = "SELECT email FROM users WHERE email = '#{li_email}' AND password = '#{li_password}';"
    result = connection.exec(query)
    if result.map { |users| users['email']} == [li_email]
      return true
    else
      return false
    end
  end

  def self.password_list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Makersbnb_test')
    else
      connection = PG.connect(dbname: 'Makersbnb')
    end
    result = connection.exec('SELECT password FROM users')
    result.map { |users| users['password'] }
  end

  def self.email_list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Makersbnb_test')
    else
      connection = PG.connect(dbname: 'Makersbnb')
    end
    result = connection.exec('SELECT email FROM users')
    result.map { |users| users['email'] }
  end

  def self.get_user_id
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Makersbnb_test')
    else
      connection = PG.connect(dbname: 'Makersbnb')
    end
    query = "SELECT id FROM users WHERE email = '#{@li_email}' AND password = '#{@li_password}';"
    result = connection.exec(query)
    result.map { |users| users['id']}
  end

end
