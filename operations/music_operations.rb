require_relative '../classes/music'
require_relative '../classes/genre'
require 'json'
require_relative 'persist_data'
class MusicOperations
  def initialize
    @music_albums = []
    @genres = []
  end

  # Function to Retrieve albums

  def list_all_albums
    load_albums = PersistData.new('./store/albums.json')
    albums = load_albums.load
    if albums.empty?
      puts 'no album records found'.upcase
    else
      albums.each_with_index do |album, index|
        puts "(#{index}) Music_Album: #{album['publish_date']}, OnSpotfy: #{album['on_spotify']}"
      end
    end
  end

  # Function to retrieve genre

  def list_all_genres
    load_genres = PersistData.new('./store/genres.json')
    genres = load_genres.load
    if genres.empty?
      puts 'no genre records found'.upcase
    else
      genres.each_with_index do |genre, index|
        puts "#{index + 1}. Genre: #{genre['name']}"
      end
    end
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
    store_album
    puts 'Music album added successfully!'
  end

  # Method to store genre

  def store_genre
    stored_genres = PersistData.new('./store/genres.json')
    genres = stored_genres.load
    @genres.each do |genre|
      genres.push({ name: genre.name })
    end
    stored_genres.save(genres)
  end

  # Method to store albums

  def store_album
    stored_albums = PersistData.new('./store/albums.json')
    albums = stored_albums.load
    @music_albums.each do |album|
      albums.push({ publish_date: album.publish_date, on_spotify: album.on_spotify })
    end
    stored_albums.save(albums)
  end
end
