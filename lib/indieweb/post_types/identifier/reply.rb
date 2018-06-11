module Indieweb
  module PostTypes
    module Identifier
      module Reply
        extend Indieweb::PostTypes::Identifier::Base

        class << self
          private

          def identifier_from(data)
            return unless data.key?('in-reply-to')
            return unless valid_url?(data['in-reply-to'])

            'reply'
          end
        end
      end
    end
  end
end
