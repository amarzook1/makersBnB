require 'pg'
require_relative 'user'

class Space

  def self.create(name:, description:, price:)
    x = User.get_user_id[0]
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Makersbnb_test')
    else
      connection = PG.connect(dbname: 'Makersbnb')
    end
    query = "INSERT INTO spaces (users_id, name, description, price) VALUES('#{x}', '#{name}', '#{description}', '#{price}') RETURNING users_id, name, description, price;"
    connection.exec(query)
  end

  def self.update
    space_id = User.get_user_id[0]
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Makersbnb_test')
    else
      connection = PG.connect(dbname: 'Makersbnb')
    end
    query = "UPDATE spaces SET availability = FALSE WHERE users_id = #{space_id};"
    connection.exec(query)
  end

  def self.get_name
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Makersbnb_test')
    else
      connection = PG.connect(dbname: 'Makersbnb')
    end
    query = 'SELECT * FROM spaces;'
    result = connection.exec(query)
    result.map { |spaces| spaces['name'] }
  end

  def self.get_description
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Makersbnb_test')
    else
      connection = PG.connect(dbname: 'Makersbnb')
    end
    query = 'SELECT * FROM spaces;'
    result = connection.exec(query)
    result.map { |spaces| spaces['description'] }
  end

  def self.get_price
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Makersbnb_test')
    else
      connection = PG.connect(dbname: 'Makersbnb')
    end
    query = 'SELECT * FROM spaces;'
    result = connection.exec(query)
    result.map { |spaces| spaces['price'] }
  end

  def self.get_availability
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Makersbnb_test')
    else
      connection = PG.connect(dbname: 'Makersbnb')
    end
    query = 'SELECT * FROM spaces;'
    result = connection.exec(query)
    result.map { |spaces| spaces['availability'] }
  end

end
