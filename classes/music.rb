require_relative 'item'
require 'date'

class Music < Item
  attr_accessor :publish_date, :on_spotify, :archived

  def initialize(publish_date:, on_spotify: true, name: 'unknown', archived: false)
    super(publish_date: publish_date, name: name, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify
  end

  private :can_be_archived?
end
