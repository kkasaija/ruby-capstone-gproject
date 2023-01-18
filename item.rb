require 'date'

class Item
  attr_reader :genre, :author, :label
  attr_accessor :id, :archived, :source, :publish_date

  def initialize(genre, author, lable, source, publish_date)
    @genre = genre
    @author = author
    @source = source
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
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
