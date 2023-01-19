class Label
  attr_accessor :items, :color, :title, :id

  def initialize(title:, color:)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end
end
