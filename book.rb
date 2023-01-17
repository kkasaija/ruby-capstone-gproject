class Book
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, author, archived: false)
    super(publish_date, archived, author)
    @publisher = publisher
    @cover_state = cover_state
  end
end
