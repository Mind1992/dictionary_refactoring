require 'rspec'
require 'word'

describe Word do
  it 'creates a word object' do
    new_word = Word.new('carrot')
    expect(new_word).to be_an_instance_of Word
  end
end
