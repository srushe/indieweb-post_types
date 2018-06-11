module Indieweb
  module PostTypes
    module Identifier
      module Repost
        extend Indieweb::PostTypes::Identifier::Base

        class << self
          private

          def identifier_from(data)
            return unless data.key?('repost-of')
            return unless valid_url?(data['repost-of'])

            'repost'
          end
        end
      end
    end
  end
end
