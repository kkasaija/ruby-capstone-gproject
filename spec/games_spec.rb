require_relative 'spec_helper'

describe 'Game' do
  before :each do
    @game = Game.new(multiplayer: 'yes', last_played_at: '2023-04-27', publish_date: '2000-05-18', name: 'Afcon')
  end

  describe 'Describes the instance of the games parameters and methods' do
    it 'is an instance of Game' do
      expect(@game).to be_an_instance_of(Game)
    end

    it 'should return correct name' do
      expect(@game.name).to eq('Afcon')
    end

    it 'should not archive the game' do
      can_be_archived = @game.send(:can_be_archived?) # accessing a private method
      expect(can_be_archived).to be_falsy
    end

    it 'should not be archivable' do
      @game.last_played_at = Date.parse('2000-02-10')
      can_be_archived = @game.send(:can_be_archived?)
      expect(can_be_archived).to be_truthy
    end
  end
end
