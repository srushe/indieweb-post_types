module Indieweb
  module PostTypes
    module Identifier
      module Photo
        extend Indieweb::PostTypes::Identifier::Base

        class << self
          private

          def identifier_from(data)
            return unless data.key?('photo')
            return unless valid_url?(url_from(data['photo']))

            'photo'
          end

          def url_from(data)
            photo = data.is_a?(Array) ? data[0] : data
            photo.is_a?(String) ? photo : photo['value']
          end
        end
      end
    end
  end
end
