require_relative('../db/sql_runner.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
          VALUES ($1, $2)
          RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first()
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) =
          ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN
        tickets ON tickets.film_id =
        films.id WHERE tickets.customer_id = $1"
    values = [@id]
    film_hashes = SqlRunner.run(sql, values)
    return Film.map_items(film_hashes)
  end

  def pay_ticket(film)
    @funds -= film.price
    update()
    # sql = "INSERT INTO tickets (customer_id, film_id)
    #       VALUES ($1, $2)
    #       RETURNING id"
    # values = [@customer_id, ticket.film_id]
    # ticket = SqlRunner.run(sql, values).first()
    # @id = ticket['id'].to_i
  end

  def how_many_tickets()
    sql = "SELECT * FROM tickets WHERE customer_id = $1"
    values = [@id]
    tickets =  SqlRunner.run(sql, values)
    return tickets.count
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customer_hashes = SqlRunner.run(sql)
    return self.map_items(customer_hashes)
  end

  def self.map_items(customer_hashes)
    result = customer_hashes.map{|customer_hash| self.new(customer_hash)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end
