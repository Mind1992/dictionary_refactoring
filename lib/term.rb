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
    @@all
  end


end
