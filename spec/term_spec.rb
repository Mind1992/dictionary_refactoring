require 'rspec'
require 'term'

describe Term do
  before do
    Term.clear
  end

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

  describe '.clear' do
    it 'returns an empty dictionary' do
      Term.new('carrot', 'A delicious vegetable.').save
      Term.clear
      expect(Term.all).to eq []
    end
  end

  it "should edit terms' words" do
    Term.clear
    test_term = Term.new('carrot', 'A delicious vegetable.')
    test_term.save
    test_term2 = Term.new('beet', 'A nasty vegetable.')
    test_term2.save
    test_term.edit_word 'carrotte'
    expect(test_term.word).to eq 'carrotte'
  end

  it "should edit words' definitions" do
    test_term = Term.new('carrot', 'A delicious vegetable.')
    test_term.save
    test_term2 = Term.new('beet', 'A nasty vegetable.')
    test_term2.save
    test_term.edit_definition 'A healthy vegetable'
    expect(test_term.definition).to eq 'A healthy vegetable'
  end
end

