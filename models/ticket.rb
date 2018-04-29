require_relative('../db/sql_runner.rb')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id)
          VALUES ($1, $2)
          RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values).first()
    @id = ticket['id'].to_i
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id) =
          ($1, $2) WHERE id = $3"
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  # def Ticket.save_new(customer, film)
  #   sql = "INSERT INTO tickets (customer_id, film_id)
  #         VALUES ($1, $2)
  #         RETURNING id"
  #   values = [@customer_id, @film_id]
  #   ticket = SqlRunner.run(sql, values).first()
  #   @id = ticket['id'].to_i
  # end

  def self.all()
    sql = "SELECT * FROM tickets"
    ticket_hashes = SqlRunner.run(sql)
    return self.map_items(ticket_hashes)
  end

  def self.map_items(ticket_hashes)
    result = ticket_hashes.map { |ticket_hash|
    self.new(ticket_hash)}
    return result
  end

  def self.delete_all()
    sql = "DELETE  FROM tickets"
    SqlRunner.run(sql)
  end

end
