require 'indieweb/post_types/version'
require 'indieweb/post_types/configuration'

module Indieweb
  module PostTypes
    extend Configuration

    class << self
      def type_from(data)
        identifiers.each do |klass|
          type = klass.type_from(data)
          return type unless type.nil?
        end
      end
    end
  end
end
