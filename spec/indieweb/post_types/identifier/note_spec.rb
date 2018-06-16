RSpec.describe Indieweb::PostTypes::Identifier::Note do
  context '.type_from' do
    context 'when the identifier should identify the type' do
      examples_for(:rsvp, :reply, :repost, :like, :video, :photo, :article, :note).each do |filename|
        context "when the data is from #{filename}" do
          let(:data) { json_data_for(filename) }

          it { expect(described_class.type_from(data)).to eq('note') }
        end
      end
    end
  end
end
