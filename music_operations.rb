require './music'
require './genre'
require 'json'
require './persist_data'
class MusicOperations
  def initialize
    @music_albums = []
    @genres = []
  end

  def add_genre(item)
    puts 'Enter genre name: '
    name = gets.chomp
    genre = Genre.new(name)
    genre.add_item(item)
    @genres.push(genre)
    puts 'Genre added successfully!'
  end
end
