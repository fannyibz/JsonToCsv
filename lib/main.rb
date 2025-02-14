# frozen_string_literal: true

require_relative "converter/base"
require_relative "converter/json_parser"
require_relative "converter/csv_storer"

Dir.glob("input_json_files/*.json").each do |input_file_path|
  puts "Converting #{input_file_path}..."
  output_file_path = File.join('output_csv_files_2', File.basename(input_file_path, '.json') + '.csv')
  Converter::Base.new(input_file_path, output_file_path).call
  puts "Done"
end
