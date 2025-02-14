# frozen_string_literal: true

module Converter
  class CsvStorer
    def initialize(output_filepath, headers, lines)
      @output_filepath = output_filepath
      @headers = headers
      @lines = lines
    end

    def call
      CSV.open(@output_filepath, "wb") do |csv|
        csv << @headers
        @lines.each do |line|
          csv << line
        end
      end
    end
  end
end
