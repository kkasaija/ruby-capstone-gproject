require_relative 'spec_helper'

describe 'Create a Genre' do
  before :each do
    @genre = Genre.new('Hiphop')
    @item = Item.new(name: 'name', publish_date: '2020-02-02', archived: false)
  end

  describe 'genre is an instance of Genre' do
    it 'is an instance of Genre' do
      expect(@genre).to be_instance_of(Genre)
    end

    it 'items is an empty array' do
      expect(@genre.items).to be_empty
    end

    it 'should add item to add_item method' do
      @genre.add_item(@item)
      expect(@genre.items).to match_array([@item])
    end

    it 'should add item to add_item method' do
      @genre.add_item(@item)
      expect(@item.genre).to eql @genre
    end
  end
end
