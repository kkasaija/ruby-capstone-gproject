class Book
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, author, archived: false)
    super(publish_date, archived, author)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  private :can_be_archived?
end
