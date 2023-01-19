require 'date'

class Item
  attr_reader :genre, :author, :label
  attr_accessor :id, :archived, :source, :publish_date, :name

  def initialize(publish_date:, name:, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @name = name
  end

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end

  def move_to_archive
    @archived = (can_be_archived?)? true : false
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end
   private :can_be_archived?
end
