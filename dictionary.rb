require './lib/term'

def main_menu
  loop do
    puts "***Dictionary***"
    puts "1: add term"
    puts "2: list all words"
    puts "3: list all words and their definition"
    puts "4: edit word"
    puts "5: edit definition"
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
      edit_definition
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
  Term.all.each do |term|
    i = 1
    puts "#{i}. " + term.word + "\n"
    i +=1
  end
end

def show_definitions
  puts "Your words and definitions are\n"
  Term.all.each do |term|
    i = 1
    print "#{i}. Word: #{term.word}, "
    print "Definition: #{term.definition}" + "\n"
    i +=1
  end
end

def edit_words
  puts "Select the number you want to edit"
  show_words
  selected_word = gets.chomp.to_i
  puts "#{Term.all[selected_word - 1].word}"

end


main_menu
