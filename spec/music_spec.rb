require_relative 'spec_helper'

describe 'Create a MusicAlbum' do
  before :each do
    @music = Music.new(name: 'name', publish_date: '2000-01-02', archived: false, on_spotify: true)
  end

  describe 'music is an instance of Music Album' do
    it 'is an instance of Music Album' do
      expect(@music).to be_instance_of Music
    end

    it 'show inheritance from Item class' do
      expect(@music).to be_kind_of(Item)
    end

    it 'archives the music album' do
      can_be_archived = @music.send(:can_be_archived?)
      expect(can_be_archived).to be_truthy
    end

    it 'shows archived to be false' do
      expect(@music.archived).to be false
    end
    it 'shows on_spotify to be true' do
      expect(@music.on_spotify).to be true
    end

    it 'should be archivable' do
      @music.publish_date = Date.parse('2000-02-10', '%Y-%m-%d')
      can_be_archived = @music.send(:can_be_archived?)
      expect(can_be_archived).to be_truthy
    end
  end
end
