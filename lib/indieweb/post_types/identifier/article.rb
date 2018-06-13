module Indieweb
  module PostTypes
    module Identifier
      module Article
        extend Indieweb::PostTypes::Identifier::Base

        class << self
          private

          def identifier_from(data)
            return unless applicable_data?(data)
            return if content_or_summary_starts_with_name?(data)

            'article'
          end

          def applicable_data?(data)
            (non_empty_content?(data) || non_empty?('summary', data)) &&
              non_empty_name?(data)
          end

          def content_or_summary_starts_with_name?(data)
            non_empty_content_or_summary(data).start_with?(non_empty_name(data))
          end

          def non_empty_content?(data)
            return false unless data.fetch('content', nil).is_a?(Array)

            data['content'].any? do |content|
              if content.is_a?(Hash)
                content.any? { |_key, value| !value.strip.empty? }
              else
                !content.strip.empty?
              end
            end
          end

          def non_empty_name?(data)
            non_empty?('name', data)
          end

          def non_empty?(field, data)
            return false unless data.key?(field)

            Array(data[field]).any? { |entry| !entry.strip.empty? }
          end

          def non_empty_content_or_summary(data)
            value = first_non_empty_content_for(data) ||
                    first_non_empty_for('summary', data)
            value.strip.squeeze(' ')
          end

          def non_empty_name(data)
            first_non_empty_for('name', data).strip.squeeze(' ')
          end

          def first_non_empty_content_for(data)
            data['content'].each do |content|
              if content.is_a?(Hash)
                %w[value html].each do |key|
                  next unless content.key?(key)
                  return content[key] unless content[key].strip.empty?
                end
              else
                return content unless content.strip.empty?
              end
            end
          end

          def first_non_empty_for(field, data)
            Array(data[field]).find { |entry| !entry.strip.empty? }
          end
        end
      end
    end
  end
end
