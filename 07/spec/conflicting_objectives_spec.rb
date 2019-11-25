require_relative '../conflicting_objectives'

RSpec.describe ConflictingObjectives do
  subject { described_class.new }

  let(:fake_file) { StringIO.new("Here's some text\n and some more") }
  
  describe '#read_words' do
    it 'returns a string' do
      expect(subject.read_words).to be_a String
    end
  end
end
