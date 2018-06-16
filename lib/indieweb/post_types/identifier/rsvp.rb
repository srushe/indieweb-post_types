module Indieweb
  module PostTypes
    module Identifier
      module Rsvp
        extend Indieweb::PostTypes::Identifier::Base

        class << self
          private

          def identifier_from(data)
            return unless data.key?('rsvp')
            return unless valid_value?(Array(data['rsvp'])[0])

            'rsvp'
          end

          def valid_value?(value)
            %w[yes no maybe interested].include?(value.downcase)
          end
        end
      end
    end
  end
end
