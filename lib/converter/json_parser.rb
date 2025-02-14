
# frozen_string_literal: true

require 'json'

module Converter
  class JsonParser
    def initialize(input_filepath)
      @input_filepath = input_filepath
    end

    def call
      JSON.parse(File.read(@input_filepath))
    rescue JSON::ParserError => e
      raise e.message
    end
  end
end
