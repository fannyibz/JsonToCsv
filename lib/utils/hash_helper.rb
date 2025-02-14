# frozen_string_literal: true

module Utils
  module HashHelper
    module_function

    def get_multiple_hash_keys(array_of_hashes)
      array_of_hashes.map { |item| get_hash_keys(item) }.flatten.uniq
    end


    def get_hash_keys(hash, parent_key = nil)
      hash.flat_map do |key, value|
        current_key = parent_key ? "#{parent_key}.#{key}" : key
        value.is_a?(Hash) ? get_hash_keys(value, current_key) : current_key
      end
    end

    def get_multiple_hash_values(array_of_hashes)
      array_of_hashes.map do |item|
        item.flat_map do |_key, value|
          case value
          when Hash
            get_hash_values(value)
          when Array
            value.join(',')
          else
            value
          end
        end
      end
    end

    def get_hash_values(hash)
      hash.flat_map { |key, value| value.is_a?(Hash) ? get_hash_values(value) : value }
    end
  end
end
