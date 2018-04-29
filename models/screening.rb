require_relative('../db/sql_runner.rb')

class Screening
  attr_reader :id
  attr_accessor :film_id, :show_time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @show_time = options['show_time']
  end

  def save()
    sql = "INSERT INTO screenings (film_id, show_time)
          VALUES ($1, $2)
          RETURNING id"
    values = [@film_id, @show_time]
    screening = SqlRunner.run(sql, values).first()
    @id = screening['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def self.map_items(screening_hashes)
    result = screening_hashes.map{ |screening_hash|
    self.new(screening_hash)}
    return result
  end

end
