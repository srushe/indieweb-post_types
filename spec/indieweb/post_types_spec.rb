RSpec.describe Indieweb::PostTypes do
  let(:default_identifiers) { described_class.default_identifiers }

  context 'with the default identifiers' do
    it 'lists the identifiers correctly' do
      expect(described_class.identifiers).to eq(default_identifiers)
    end

    %i[rsvp reply repost like video photo article note].each do |post_type|
      examples_for(post_type).each do |filename|
        context "when the file is #{filename}" do
          let(:data) { json_data_for(filename) }

          it { expect(described_class.type_from(data)).to eq(post_type.to_s) }
        end
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

    examples_for(:rsvp, :reply, :repost, :like, :video, :photo, :article, :note).each do |filename|
      context "when the file is #{filename}" do
        let(:data) { json_data_for(filename) }

        it { expect(described_class.type_from(data)).to eq('catchall') }
      end
    end
  end
end
