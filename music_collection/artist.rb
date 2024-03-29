require('pg')
require_relative("../db/sql_runner.rb")
require_relative("./album.rb")

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO artists
    (name) VALUES ($1)
    RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map{|artist| Artist.new(artist)}
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return albums.map{ |album| Album.new(album)}
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name]
    SqlRunner.run(sql, values)
  end

  def self.find_artist(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    result_hash = results.first
    result_artist = Artist.new(result_hash)
    return result_artist
  end
end
