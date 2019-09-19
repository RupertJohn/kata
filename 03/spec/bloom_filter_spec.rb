require 'rspec'
require_relative '../bloom_filter'

RSpec.describe BloomFilter do
    subject { described_class.new }

    it 'adds items to filter' do
        subject.insert 'hello'
        ones = []
        subject.bits.each.with_index { |x, i| ones << i if x == 1 }
        expect(ones).to eq [4119, 10870, 16426, 23873, 40337, 47473, 48203, 50578]
    end

    it 'returns false when item not in filter' do
        expect(subject.contains? 'hello').to be false
    end

    it 'returns true if item in filter' do
        subject.insert 'hello'
        expect(subject.contains? 'hello').to be true
    end
end
