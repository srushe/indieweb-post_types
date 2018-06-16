RSpec.describe Indieweb::PostTypes::Identifier::Like do
  context '.type_from' do
    context 'when the identifier should identify the type' do
      examples_for(:like).each do |filename|
        context "when the data is from #{filename}" do
          let(:data) { json_data_for(filename) }

          it { expect(described_class.type_from(data)).to eq('like') }
        end
      end
    end

    context 'when the identifier should not identify the type' do
      examples_for(:video, :photo, :article, :note).each do |filename|
        context "when the data is from #{filename}" do
          let(:data) { json_data_for(filename) }

          it { expect(described_class.type_from(data)).to be_nil }
        end
      end

      context 'due to the url not being acceptable' do
        let(:data) do
          json_data_for('entry/like-aaron.json').tap do |data|
            data['properties']['like-of'] = url
          end
        end

        context 'because it is not valid' do
          let(:url) { 'https://foo bar.com/' }

          it { expect(described_class.type_from(data)).to be_nil }
        end

        context 'due to the url not being http or https' do
          let(:url) { 'ftp://example.com/' }

          it { expect(described_class.type_from(data)).to be_nil }
        end
      end
    end
  end
end
