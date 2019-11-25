require_relative '../conflicting_objectives'

RSpec.describe ConflictingObjectives do
  subject { described_class.new(fake_file) }

  let(:fake_file) { StringIO.new("Here's\nsome\ntext\nand\nsome\nmore\nreallylongword") }

  describe '#words' do
    specify { expect(subject.words).to be_an Array }

    it 'returns all words that are 6 characters or less' do
      expect(subject.words).to eq(%w[
        Here's
        some
        text
        and
        some
        more
      ])
    end
  end
end
