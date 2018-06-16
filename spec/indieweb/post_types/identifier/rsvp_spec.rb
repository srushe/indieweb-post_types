RSpec.describe Indieweb::PostTypes::Identifier::Rsvp do
  context '.type_from' do
    context 'when the identifier should identify the type' do
      %w[
        rsvp-aaron.json
        rsvp-aaronmultiple.json
        rsvp-tantek.json
      ].each do |filename|
        context "when the data is from #{filename}" do
          let(:data) { example_data_for(filename) }

          it { expect(described_class.type_from(data)).to eq('rsvp') }
        end
      end
    end

    context 'when the identifier should not identify the type' do
      %w(
        reply-aaron.json
        reply-aaronmultiple.json
        repost-aaron.json
        like-aaron.json
        video-aaron.json
        video-shane.json
        photo-aaron.json
        photo-tantek.json
        article-aaron.json
        article-aaron.json
        article-tantek.json
        note-aaron.json
        note-aaron2.json
      ).each do |filename|
        context "when the data is from #{filename}" do
          let(:data) { example_data_for(filename) }

          it { expect(described_class.type_from(data)).to be_nil }
        end
      end
    end
  end
end
