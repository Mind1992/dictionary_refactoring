class Term

  attr_accessor :word, :definition

  @@all = []

  def initialize(word, definition)
    @word = word
    @definition = definition
  end

  def Term.all
    @@all
  end

  def save
    @@all << self
  end

  def Term.clear
    @@all = []
  end

  def edit_word(new_word)
    @word = new_word
  end
end
