
require "json"

module Converter
  class JsonParser
    def initialize(input_filepath)
      @input_filepath = input_filepath
    end

    def call
      JSON.parse(File.read(@input_filepath))
    end
  end
end
