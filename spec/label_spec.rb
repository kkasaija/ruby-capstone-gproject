require_relative 'spec_helper'

describe 'Label' do
  before :each do
    @label = Label.new(title: 'commedy', color: 'purple')
    @item = Item.new(name: 'mr. bean', publish_date: '2011-12-2', archived: false)
  end

  describe 'This is instantiated in before(:each)' do
    it 'is an instance of Label' do
      expect(@label).to be_an_instance_of(Label)
    end

    it 'has items as an empty array' do
      expect(@label.items).to be_empty
    end

    it 'adds an item to items' do
      @label.add_item(@item)
      expect(@label.items[0]).to be(@item)
    end
  end
end
