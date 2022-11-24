require_relative '../cap_decorator'
require_relative '../person'

describe 'Cap_decorator' do
  context 'should create an instance of Cap_Decorator class' do
    it 'Should return a capitalized person name' do
      person = Person.new(23, 'walid')
      capitalized = CapitalizeDecorator.new(person)
      expect(capitalized.correct_name) == 'walid'.capitalize
    end
  end
end
