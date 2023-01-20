require_relative 'spec_helper'

describe Author do
  let(:author) { Author.new(first_name: 'John', last_name: 'Doe') }

  describe '#initialize' do
    it 'should set the first name and last name' do
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
    end

    it 'should set a random id between 1 and 1000' do
      expect(author.id).to be_between(1, 1000)
    end
  end

  describe '#add_item' do
    it 'should add an item to the items array' do
      author.add_item('Book 1')
      expect(author.items).to include('Book 1')
    end
  end
end
