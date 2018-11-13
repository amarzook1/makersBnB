require 'pg'

class Space
  attr_reader :id, :name, :description, :price, :availability

  def initialize(params = {})
    @db = PG.connect(dbname: 'Makersbnb')
    @id = (:id)
    @name = (:name)
    @description = (:description)
    @price = (:price)
    @availability = (:availability)
  end

  def Create(name:, description:, price:)
    result = @db.exec("INSERT INTO spaces (name, description, price) VALUES('#{name}', '#{description}', '#{price}') RETURNING id, name, description, price;")
    Space.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], availability: result[0][1])
  end

end
