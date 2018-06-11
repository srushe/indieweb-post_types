module Indieweb
  module PostTypes
    module Identifier
      module Note
        extend Indieweb::PostTypes::Identifier::Base

        class << self
          private

          def identifier_from(_data)
            'note'
          end
        end
      end
    end
  end
end
