RSpec.shared_examples_for 'a default configuration' do
  context '.logger' do
    it { expect(Indieweb::PostTypes.logger).to be_an_instance_of(Logger) }
    it { expect(Indieweb::PostTypes.logger.progname).to eq('IndiewebPostTypes') }
    it { expect(Indieweb::PostTypes.logger.level).to eq(Logger::WARN) }
  end

  context '.identifiers' do
    it { expect(Indieweb::PostTypes.identifiers).to eq(Indieweb::PostTypes.default_identifiers) }
  end
end

RSpec.describe Indieweb::PostTypes::Configuration do
  context '.configure' do
    context 'default configuration' do
      it_behaves_like 'a default configuration'
    end

    context '.logger' do
      before do
        Indieweb::PostTypes.configure do |config|
          config.logger = 'a logger'
        end
      end

      it { expect(Indieweb::PostTypes.logger).to eq('a logger') }
    end

    context '.identifiers' do
      before do
        Indieweb::PostTypes.configure do |config|
          config.identifiers = ['a', 'b', 'c']
        end
      end

      it { expect(Indieweb::PostTypes.identifiers).to eq(['a', 'b', 'c']) }
    end

    context '.insert_identifier' do
      let(:default_identifiers) { Indieweb::PostTypes.default_identifiers }
      let(:expected_identifiers) do
        default_identifiers[0..-2] +
        ['AnExtraIdentifierClass'] +
        [default_identifiers.last]
      end

      before do
        Indieweb::PostTypes.reset_configuration!
        Indieweb::PostTypes.configure do |config|
          config.insert_identifier(klass: 'AnExtraIdentifierClass',
                                   before: Indieweb::PostTypes.identifiers.last)
        end
      end

      it 'includes the added identifier correctly' do
        expect(Indieweb::PostTypes.identifiers).to eq(expected_identifiers)
      end
    end
  end

  context '.reset_configuration!' do
    before do
      Indieweb::PostTypes.reset_configuration!
      Indieweb::PostTypes.configure do |config|
        config.insert_identifier(klass: 'AnExtraIdentifierClass',
                                 before: Indieweb::PostTypes.identifiers.last)
      end
      Indieweb::PostTypes.reset_configuration!
    end

    it_behaves_like 'a default configuration'
  end
end
