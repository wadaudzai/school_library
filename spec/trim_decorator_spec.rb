require_relative '../trim_decorator'
require_relative '../person'

describe TrimmerDecorator do
  context 'Use a Trimmer Decorator' do
    it 'Should return a trimmed person name' do
      person = Person.new(23, 'walid')
      trimmed = TrimmerDecorator.new(person)
      expect(trimmed.correct_name) == 'wal'
    end
  end
end