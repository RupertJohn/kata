require 'rspec'
require_relative '../concatenations.rb'

RSpec.describe ConcatenationFinder do
  subject { described_class.new(dictionary) }

  let(:dictionary) { StringIO.new("hellos\njigsaw\njig\nsaw\nlongerword\nshort\n") }

  before do
    allow(File).to receive(:open).and_return(dictionary)
  end

  context 'when the word is 6 characters' do
    context 'when the word is not composed of sub-words' do
      let(:target_word) { 'hellos' }

      it 'contains the word in the dictionary' do
        expect(subject.dictionary).to include(target_word)
      end

      it 'does not include it in the result' do
        expect(subject.find!).not_to include(target_word)
      end
    end
  end
end
