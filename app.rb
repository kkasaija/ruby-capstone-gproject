require './book_operations'
require './music_operations'
class App
  def console_entry_point
    puts ''
    puts 'Welcome to my catalog of things App'
    until list_options
      input = gets.chomp
      if input.upcase == 'Q'
        puts 'Thanks for using this catalog'
        break
      end
      option(input)
      extras(input)
    end
  end

  def list_options
    puts('-------------------------------')
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    puts '4 - List all genres'
    puts '5 - List all labels'
    puts '6 - List all authors'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts 'Q -> Quit'
    puts('-------------------------------')
    print 'Select operation: '
  end

  def option(input)
    operation = BookOperations.new
    music = MusicOperations.new
    case input
    when '1'
      operation.list_all_books
    when '2'
      # list all music albums
      music.list_all_albums
    when '3'
      # list_of_games
    when '4'
      # list all genres
      music.list_all_genres
    when '5'
      operation.list_all_labels
    when '6'
      # list_all_authors
    end
  end

  def extras(option)
    operation = BookOperations.new
    music = MusicOperations.new
    case option
    when '7'
      operation.add_book
    when '8'
      # add_album
      music.add_music_album
    when '9'
      # add_game
    else
      'Out of range, Enter digits: 1 thru 9'
    end
  end
end
