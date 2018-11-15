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

  def self.space_table
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Makersbnb_test')
    else
      connection = PG.connect(dbname: 'Makersbnb')
    end
    query = 'SELECT name FROM spaces;'
    result = connection.exec(query)
    result.map { |spaces| spaces['name'] }
  end

end
