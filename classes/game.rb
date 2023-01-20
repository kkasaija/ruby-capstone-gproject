require_relative 'item'
require 'date'
class Game < Item
  attr_accessor :name, :publish_date, :last_played_at, :multiplayer

  def initialize(multiplayer:, last_played_at:, publish_date:, name: 'unknown', archived: false)
    super(publish_date: publish_date, archived: archived, name: name)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    super && (Date.today.year - @last_played_at.year) > 10
  end

  private :can_be_archived?
end
