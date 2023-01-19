require './music'
require './genre'
require 'json'
require './persist_data'
class MusicOperations
  def initialize
    @music_albums = []
    @genres = []
  end

  # Function to add genre

  def add_genre(item)
    puts 'Enter genre name: '
    name = gets.chomp
    genre = Genre.new(name)
    genre.add_item(item)
    @genres.push(genre)
    store_genre
    puts 'Genre added successfully!'
  end

  # Function to add albums

  def add_music_album
    puts 'Is the music on spotify? (Y/N): '
    on_spotify = gets.chomp.downcase == 'y'
    puts 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    music = Music.new(publish_date: publish_date, on_spotify: on_spotify)
    add_genre(music)
    @music_albums.push(music)
    puts 'Music album added successfully!'
  end

  # Method to store genre

  def store_genre
    stored_genres = PersistData.new('genres.json')
    genres = stored_genres.load
    @genres.each do |genre|
      genres.push({ name: genre.name })
    end
    stored_genres.save(genres)
  end
end
