require_relative('../db/sql_runner.rb')

class Screening
  attr_reader :id
  attr_accessor :film_id, :show_time1, :show_time2

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @show_time1 = options['show_time1']
    @show_time2 = options['show_time2']
  end

  def save()
    sql = "INSERT INTO screenings (film_id, show_time1, show_time2)
          VALUES ($1, $2, $3)
          RETURNING id"
    values = [@film_id, @show_time1, @show_time2]
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
