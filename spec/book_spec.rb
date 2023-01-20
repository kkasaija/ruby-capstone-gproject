require_relative 'spec_helper'

describe 'Book' do
  before :each do
    @book = Book.new(cover_state: 'good', name: 'The Silent Patient', publisher: 'Macmillan Publishers',
                     publish_date: '2010-10-12')
  end

  describe 'initialized in before(:each)' do
    it 'is an instance of Book' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'returns true when coverstate' do
      expect(@book.archived).to eql false
    end

    it 'returns true if parent method returns true OR if cover_state equals to "bad"' do
      @book.move_to_archive
      expect(@book.archived).to eql true
    end

    it 'inherits from Item class' do
      expect(@book).to be_kind_of(Item)
    end
  end
end
