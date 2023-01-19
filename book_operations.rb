require 'json'
require './book'
require './label'

class BookOperations
  def initialize
    @books = []
    @labels =[]
  end

  # Function to create a lable
  
  def create_label
    print 'Add label title: '
    title = gets.chomp
    print 'Add label color: '
    color = gets.chomp
    Label.new(title: title, color: color)
  end
  
    # Function to add Book
  
    def add_book
      print 'Enter book name: '
      name = gets.chomp
      print 'Enter book publisher: '
      publisher = gets.chomp
      print 'Enter publish date: '
      publish_date = gets.chomp
      print 'Enter cover state cover state (good/bad): '
      cover_state = gets.chomp
      book = Book.new(name: name, cover_state: cover_state, publisher: publisher, publish_date: publish_date)
      label = handle_label
      label.add_item(book)
      @labels << label unless @labels.include?(label)
      @books << book
      puts 'Book added successfully'
    end

    # Label Handling method

    def handle_label
      if @labels.any?
        print "enter 'N' to create a new label or 'S' to select an existing one"
        option = gets.chomp.upcase
        case option
        when 'N'
          create_label
        when 'S'
          puts 'select a label from the list by index'
          list_all_labels
          option = gets.chomp
          @labels[option.to_i]
        else
          print 'invalid entry'
        end
      else
        create_label
      end
    end
end