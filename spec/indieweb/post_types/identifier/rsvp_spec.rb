RSpec.describe Indieweb::PostTypes::Identifier::Rsvp do
  context '.type_from' do
    context 'when the identifier should identify the type' do
      examples_for(:rsvp).each do |filename|
        context "when the data is from #{filename}" do
          let(:data) { json_data_for(filename) }

          it { expect(described_class.type_from(data)).to eq('rsvp') }
        end
      end
    end

    context 'when the identifier should not identify the type' do
      examples_for(:reply, :repost, :like, :video, :photo, :article, :note).each do |filename|
        context "when the data is from #{filename}" do
          let(:data) { json_data_for(filename) }

          it { expect(described_class.type_from(data)).to be_nil }
        end
      end
    end
  end
end
