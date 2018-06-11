require 'uri'

module Indieweb
  module PostTypes
    module Identifier
      module Base
        def type_from(data)
          data = entry_data_from(data)
          identifier_from(data)
        end

        def valid_url?(url)
          uri = URI(actual_url_from(url))
          %w[http https].include?(uri.scheme)
        rescue URI::InvalidURIError
          false
        end

        private

        def entry_data_from(data)
          return data['properties'] if data['properties']
          return data unless data.key?('items')
          data['items'].first['properties']
        end

        def actual_url_from(url)
          return url if url.is_a?(String)
          return url[0] unless url[0].is_a?(Hash)
          url_from_citation(url[0])
        end

        def url_from_citation(data)
          data['properties']['url'][0]
        end
      end
    end
  end
end
