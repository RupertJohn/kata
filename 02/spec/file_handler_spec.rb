require 'rspec'
require_relative '../file_handler'

RSpec.shared_examples 'a file handler' do
    subject { described_class }
    let(:file) { double('file') }

    before do
        allow(File).to receive(:open).and_return(file)
    end

    context 'when creating a new file handler' do
        it 'will not fail' do
            expect(subject.new('whatever', 'r')).to be_a FileHandler
        end
    end
end

RSpec.describe FileHandler do
    it_behaves_like 'a file handler'
end

RSpec.describe DatFileHandler do
    it_behaves_like 'a file handler'
end
