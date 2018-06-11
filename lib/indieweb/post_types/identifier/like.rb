module Indieweb
  module PostTypes
    module Identifier
      module Like
        extend Indieweb::PostTypes::Identifier::Base

        class << self
          private

          def identifier_from(data)
            return unless data.key?('like-of')
            return unless valid_url?(data['like-of'])

            'like'
          end
        end
      end
    end
  end
end
