require 'pg'
require_relative 'user'

class Space

  def self.create(name:, description:, price:)

    x = User.get_user_id[0]

    connection = PG.connect(dbname: 'Makersbnb')
    result = "INSERT INTO spaces (users_id, name, description, price) VALUES('#{x}', '#{name}', '#{description}', '#{price}') RETURNING users_id, name, description, price;"
    connection.exec(result)
  end
end
