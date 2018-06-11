module Indieweb
  module PostTypes
    module Identifier
      module Photo
        extend Indieweb::PostTypes::Identifier::Base

        class << self
          private

          def identifier_from(data)
            return unless data.key?('photo')
            return unless valid_url?(data['photo'])

            'photo'
          end
        end
      end
    end
  end
end
