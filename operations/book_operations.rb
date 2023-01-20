require 'json'
require_relative '../classes/book'
require_relative '../classes/label'
require_relative 'persist_data'

class BookOperations
  def initialize
    @books = []
    @labels = []
  end

  # Function to Return a list of labels

  def list_all_books
    load_books = PersistData.new('./store/books.json')
    books = load_books.load
    if books.empty?
      puts 'no book records found'.upcase
    else
      books.each_with_index do |book, index|
        puts "(#{index}) Book_Name: #{book['name']}, Publisher: #{book['publisher']}, Published_Date: #{book['publish_date']}"
      end
      puts
    end
  end

  # Function to Return a list of labels

  def list_all_labels
    load_labels = PersistData.new('./store/labels.json')
    labels = load_labels.load
    if labels.empty?
      puts 'no label records found'.upcase
    else
      labels.each_with_index do |label, index|
        puts "(#{index}) Lable_Name: #{label['title']}, Lable_Color: #{label['color']}"
      end
    end
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
    store_labels
    @books << book
    store_books
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

  # Function to store Books

  def store_books
    stored_books = PersistData.new('./store/books.json')
    books = stored_books.load
    @books.each do |book|
      books << { name: book.name, publisher: book.publisher, publish_date: book.publish_date,
                 cover_state: book.cover_state }
    end
    stored_books.save(books)
  end

  # Function to store Labels

  def store_labels
    stored_labels = PersistData.new('./store/labels.json')
    labels = stored_labels.load
    @labels.each do |label|
      labels << { title: label.title, color: label.color }
    end
    stored_labels.save(labels)
  end
end
