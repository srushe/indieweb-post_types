require 'logger'
require 'indieweb/post_types/identifier/base'
require 'indieweb/post_types/identifier/article'
require 'indieweb/post_types/identifier/like'
require 'indieweb/post_types/identifier/note'
require 'indieweb/post_types/identifier/photo'
require 'indieweb/post_types/identifier/reply'
require 'indieweb/post_types/identifier/repost'
require 'indieweb/post_types/identifier/rsvp'
require 'indieweb/post_types/identifier/video'

module Indieweb
  module PostTypes
    module Configuration
      attr_accessor :logger
      attr_accessor :identifiers

      def configure
        yield self
      end

      def reset_configuration!
        set_default_configuration
      end

      def self.extended(base)
        base.set_default_configuration
      end

      def default_identifiers
        [
          Indieweb::PostTypes::Identifier::Rsvp,
          Indieweb::PostTypes::Identifier::Reply,
          Indieweb::PostTypes::Identifier::Repost,
          Indieweb::PostTypes::Identifier::Like,
          Indieweb::PostTypes::Identifier::Video,
          Indieweb::PostTypes::Identifier::Photo,
          Indieweb::PostTypes::Identifier::Article,
          Indieweb::PostTypes::Identifier::Note
        ]
      end

      # TODO: Stop a class being inserted twice?
      def insert_identifier(klass:, before:)
        raise unless identifiers.include?(before)
        identifiers.insert(identifiers.index(before), klass)
      end

      def set_default_configuration
        self.logger = default_logger
        self.identifiers = default_identifiers
      end

      private

      # @private
      def default_logger
        Logger.new(STDOUT).tap do |logger|
          logger.progname = 'IndiewebPostTypes'
          logger.level = Logger::WARN
        end
      end
    end
  end
end
