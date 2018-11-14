require 'pg'

class Space

  def self.create(name:, description:, price:)
    connection = PG.connect(dbname: 'Makersbnb')
    result = "INSERT INTO spaces (name, description, price) VALUES('#{name}', '#{description}', '#{price}') RETURNING id, name, description, price;"
    connection.exec(result)
  end

end
