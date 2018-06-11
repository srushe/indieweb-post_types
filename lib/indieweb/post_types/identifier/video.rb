module Indieweb
  module PostTypes
    module Identifier
      module Video
        extend Indieweb::PostTypes::Identifier::Base

        class << self
          private

          def identifier_from(data)
            return unless data.key?('video')
            return unless valid_url?(data['video'])

            'video'
          end
        end
      end
    end
  end
end
