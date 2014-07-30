require 'rspec'
require 'term'

describe Term do
  it 'can read word and definition' do
    test_term = Term.new('carrot', 'A delicious vegetable.')
    expect(test_term.word).to eq 'carrot'
    expect(test_term.definition).to eq 'A delicious vegetable.'
  end

  describe '.all' do
   it 'the dictionary is empty at first' do
    expect(Term.all).to eq []
   end
  end


  it 'should add a term' do
    test_term = Term.new('carrot', 'A delicious vegetable.')
    test_term.save
    expect(Term.all).to eq [test_term]
  end

  it 'returns a list of the words from the terms' do
    test_term = Term.new('carrot', 'A delicious vegetable.')
    test_term2 = Term.new('cherry', 'A delicious fruit.')
    test_term.save
    test_term2.save
    expect(Term.all_words).to eq ["carrot", "cherry"]
  end
end
