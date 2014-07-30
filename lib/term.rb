class Term

  attr_accessor :word, :definition

  @@dictionary = []

  def initialize(word, definition)
    @word = word
    @definition = definition
  end

  def Term.all
    @@dictionary
  end

  def save
    @@dictionary << self
  end

  def Term.clear
    @@dictionary = []
  end

  def edit_word(new_word)
    @word = new_word
  end

  def edit_definition(new_definition)
    @definition = new_definition
  end

  def delete_term
    @@dictionary.delete_if {|term| term == self }
  end
end
