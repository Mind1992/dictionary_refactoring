require 'rspec'
require 'definition'

describe Definition do
  it 'initializes a new definition object' do
    new_definition = Definition.new('a nice veggie')
    expect(new_definition).to be_an_instance_of Definition
  end

  it 'lets you read the definition out' do
    new_definition = Definition.new('a nice veggie')
    expect(new_definition.definition).to eq "a nice veggie"
  end

  # it 'should add a definition' do
  #   new_definition = Definition.new('a nice veggie')
  #   new_definition.ad
  #   expect(Definition.all).to eq [new_definition]
  # end
end
