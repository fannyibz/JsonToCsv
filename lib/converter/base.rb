# frozen_string_literal: true

require 'csv'
require_relative '../utils/hash_helper'

module Converter
  class Base
    include Utils::HashHelper

    def initialize(input_filepath, output_filepath)
      @input_filepath = input_filepath
      @output_filepath = output_filepath
    end

    def call
      content = JsonParser.new(@input_filepath).call
      keys = get_multiple_hash_keys(content)
      values = get_multiple_hash_values(content)
      CsvStorer.new(@output_filepath, keys, values).call
    end
  end
end

