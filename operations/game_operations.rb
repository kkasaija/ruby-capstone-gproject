require_relative '../classes/game'
require_relative '../classes/author'
require_relative 'persist_data'

class GameOperations
  def initialize
    @games = []
    @authors = []
  end

  # Retrieve games

  def list_all_games
    load_games = PersistData.new('./store/games.json')
    games = load_games.load
    if games.empty?
      puts 'no game records found'.upcase
    else
      games.each_with_index do |game, index|
        print "(#{index}) Game_Name: #{game['name']}, Last_Played_At: #{game['last_played_at']}, "
        puts "Publish_Date: #{game['publish_date']}, Multiplayer: #{game['multiplayer']}"
      end
    end
  end

  # Retrieve authors

  def list_all_authors
    load_authors = PersistData.new('./store/authors.json')
    authors = load_authors.load
    if authors.empty?
      puts 'no author records found'.upcase
    else
      authors.each_with_index do |author, index|
        puts "(#{index}) FirstName: #{author['first_name']}, LastName: #{author['last_name']}"
      end
    end
  end

  # Function to add authors

  def add_author(game_authored)
    puts 'Enter authors first_name: '
    first_name = gets.chomp
    puts 'Enter authors last_name: '
    last_name = gets.chomp
    author = Author.new(first_name: first_name, last_name: last_name)
    author.add_item(game_authored)
    @authors.push(author)
    store_author
    puts 'Author added successfully!'
  end

  # Function to add games

  def add_game
    puts 'Enter game name: '
    name = gets.chomp
    puts 'Enter Publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    puts 'Is the game a Multiplayer? : (y/n)'
    multiplayer = gets.chomp.downcase
    puts 'Last played at (YYYY-MM-DD): '
    last_played_at = gets.chomp
    game = Game.new(multiplayer: multiplayer, last_played_at: last_played_at, publish_date: publish_date, name: name)
    add_author(game)
    @games.push(game)
    store_game
    puts 'Game added successfully!'
  end

  # Function to store authors

  def store_author
    stored_authors = PersistData.new('./store/authors.json')
    authors = stored_authors.load
    @authors.each do |author|
      authors.push({ first_name: author.first_name, last_name: author.last_name })
    end
    stored_authors.save(authors)
  end

  # Function to store games

  def store_game
    stored_games = PersistData.new('./store/games.json')
    games = stored_games.load
    @games.each do |game|
      games.push({ multiplayer: game.multiplayer, last_played_at: game.last_played_at,
                   publish_date: game.publish_date, name: game.name })
    end
    stored_games.save(games)
  end
end
