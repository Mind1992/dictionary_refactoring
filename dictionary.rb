require './lib/term'

def main_menu
  loop do
    puts "***Dictionary***"
    puts "1: add term"
    puts "2: list all words"
    puts "3: list all words and their definition"
    puts "4: edit word"
    puts "5: edit definition"
    puts "6: remove term"
    puts "7: search term"
    puts "9: exit"
    user_input = gets.chomp
    if user_input == "1"
      add_term
    elsif user_input == "2"
      show_words
    elsif user_input == "3"
      show_definitions
    elsif user_input == "4"
      edit_words
    elsif user_input == "5"
      edit_definitions
    elsif user_input == "6"
      remove_term
    elsif user_input == "7"
      search
    elsif  user_input == "9"
      exit
    else
      "This is the wrong command"
    end
  end
end

def add_term
  puts "Add word"
  word = gets.chomp
  puts "Add definition"
  definition = gets.chomp
  new_term = Term.new(word, definition)
  new_term.save
  puts "New word *#{new_term.word}* with new definition *#{new_term.definition}* added"
end

def show_words
  #Task.clear
  puts "Your words are\n"
  i = 1
  Term.all.each do |term|
    puts "#{i}. " + term.word + "\n"
    i +=1
  end
end

def show_definitions
  puts "Your words and definitions are\n"
  i = 1
  Term.all.each do |term|
    print "#{i}. Word: #{term.word}, "
    print "Definition: #{term.definition}" + "\n"
    i +=1
  end
end

def edit_words
  puts "Select the number of the word you want to edit"
  show_words
  selected_word = gets.chomp.to_i
  old_word = Term.all[selected_word - 1]
  puts "\n"
  puts "Enter the updated version of #{old_word.word}"
  new_word = gets.chomp
  old_word.edit_word(new_word)
  puts "\n"
  puts "Your updated list of words is now:"
  show_words
  puts "\n"
end

def edit_definitions
  puts "Select the number of the definition you want to edit"
  show_definitions
  selected_word = gets.chomp.to_i
  old_definition = Term.all[selected_word - 1]
  puts "\n"
  puts "Enter the updated version of #{old_definition.definition}"
  new_definition = gets.chomp
  old_definition.edit_definition(new_definition)
  puts "\n"
  show_definitions
  puts "\n"
end

def remove_term
  puts "Select the number of the word and definition you would like to delete"
  show_definitions
  selected_term = gets.chomp.to_i
  term = Term.all[selected_term - 1]
  term.delete_term
  puts "The term #{term.word} and its definition #{term.definition} has been deleted from the dictionary"
  puts "\nYou have no words in your dictionary!!\n\n" if Term.all.length == 0
end

def search
  puts "Type the word you want to search for:"
  user_input = gets.chomp
  search_term = Term.search(user_input)
  if search_term
    puts "There is no term with that name"
    search
  else
    puts "#{search_term.word} #{search_term.definition} founded"
  end
end
main_menu
