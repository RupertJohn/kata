require 'rspec'
require_relative '../file_handler'

RSpec.describe FileHandler do
    subject { described_class }

    before do
        allow(File).to receive(:open).and_return(file)
    end

    let(:file) { StringIO.new("  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP\n\n   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5\n   2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5\n   3  77    55    66          39.6       0.00         350  5.0 350   9  2.8  59 24 1016.8\n   4  77    59    68          51.1       0.00         110  9.1 130  12  8.6  62 40 1021.1\n   5  90    66    78          68.3       0.00 TFH     220  8.3 260  12  6.9  84 55 1014.4\n   6  81    61    71          63.7       0.00 RFH     030  6.2 030  13  9.7  93 60 1012.7\n") }

    context 'when creating a new file handler' do
        it 'will not fail' do
            expect(subject.new('whatever', 'r')).to be_a FileHandler
        end
    end
end

RSpec.describe DatFileHandler do
    subject { described_class }
    let(:handler) { DatFileHandler.new('whatever', 'r') }

    before do
        allow(File).to receive(:open).and_return(file)
    end

    let(:file) { StringIO.new("  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP\n\n   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5\n   2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5\n   3  77    55    66          39.6       0.00         350  5.0 350   9  2.8  59 24 1016.8\n   4  77    59    68          51.1       0.00         110  9.1 130  12  8.6  62 40 1021.1\n   5  90    66    78          68.3       0.00 TFH     220  8.3 260  12  6.9  84 55 1014.4\n   6  81    61    71          63.7       0.00 RFH     030  6.2 030  13  9.7  93 60 1012.7\n") }

    context 'when creating a new file handler' do
        it 'will not fail' do
            expect(subject.new('whatever', 'r')).to be_a FileHandler
        end
    end

    context 'with #clean!' do
        it 'cleans the data' do
            expect(handler.lines.length).to eq 5
        end
    end

    it 'dynamically defines accessor methods for headers' do
        expect { handler.Dy}.not_to raise_error
        expect { handler.false_header }.to raise_error
    end

    it 'responds to dynamically defined accessor methods' do
        expect(handler.respond_to?(:Dy)).to be true
    end
end
