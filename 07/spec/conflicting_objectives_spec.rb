require_relative '../conflicting_objectives'

RSpec.describe ConflictingObjectives do
  subject { described_class.new(fake_file) }

  let(:fake_file) { StringIO.new("Here's\nsome\ntext\nand\nsome\nmore\nreallylongword") }

  describe '#read_words' do
    it 'returns a string' do
      expect(subject.read_words).to be_a String
    end

    it 'returns the file contents' do
      expect(subject.read_words).to eq("Here's\nsome\ntext\nand\nsome\nmore\nreallylongword")
    end
  end

  describe '#filter_words!' do
    before do
      subject.read_words
    end

    it 'returns all words that are 6 characters or less' do
      expect(subject.filter_words!).to eq(%w[
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
