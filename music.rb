require './item'

class Music < Item
  attr_accessor :publish_date, :on_spotify, :archived

  def initialize(publish_date:, on_spotify: true, name: 'unknown', archived: false)
    super(publish_date: publish_date, name: name, archived: archived)
    @on_spotify = on_spotify
  end

end
