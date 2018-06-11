RSpec.describe Indieweb::PostTypes do
  let(:default_identifiers) { described_class.default_identifiers }

  context 'with the default identifiers' do
    it 'lists the identifiers correctly' do
      expect(described_class.identifiers).to eq(default_identifiers)
    end

    {
      'rsvp-aaron.json' => 'rsvp',
      'rsvp-aaronmultiple.json' => 'rsvp',
      'rsvp-tantek.json' => 'rsvp',
      'reply-aaron.json' => 'reply',
      'reply-aaronmultiple.json' => 'reply',
      'repost-aaron.json' => 'repost',
      'like-aaron.json' => 'like',
      'video-aaron.json' => 'video',
      'video-shane.json' => 'video',
      'photo-aaron.json' => 'photo',
      'photo-tantek.json' => 'photo',
      'article-aaron.json' => 'article',
      'article-tantek.json' => 'article',
      'note-aaron.json' => 'note',
      'note-aaron2.json' => 'note'
    }.each_pair do |filename, expected_type|
      context "when the file is #{filename}" do
        let(:data) { example_data_for(filename) }

        it { expect(described_class.type_from(data)).to eq(expected_type) }
      end
    end
  end

  context 'with a custom identifier' do
    module CatchAllIdentifier
      extend Indieweb::PostTypes::Identifier::Base

      class << self
        def identifier_from(_data)
          'catchall'
        end
      end
    end

    let(:expected_identifiers) do
      [CatchAllIdentifier] + default_identifiers
    end

    before do
      Indieweb::PostTypes.configure do |config|
        config.insert_identifier(klass: CatchAllIdentifier,
                                 before: described_class.identifiers.first)
      end
    end

    it 'lists the identifiers correctly' do
      expect(described_class.identifiers).to eq(expected_identifiers)
    end

    [
      'rsvp-aaron.json',
      'rsvp-aaronmultiple.json',
      'rsvp-tantek.json',
      'reply-aaron.json',
      'reply-aaronmultiple.json',
      'repost-aaron.json',
      'like-aaron.json',
      'video-aaron.json',
      'video-shane.json',
      'photo-aaron.json',
      'photo-tantek.json',
      'article-aaron.json',
      'article-aaron.json',
      'article-tantek.json',
      'note-aaron.json',
      'note-aaron2.json'
    ].each do |filename|
      context "when the file is #{filename}" do
        let(:data) { example_data_for(filename) }

        it { expect(described_class.type_from(data)).to eq('catchall') }
      end
    end
  end
end
