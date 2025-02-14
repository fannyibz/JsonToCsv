# frozen_string_literal: true

require_relative 'converter/base'
require_relative 'converter/json_parser'
require_relative 'converter/csv_storer'
require 'fileutils'

input_dir_path = ARGV[0]
output_dir_path = ARGV[1]

FileUtils.mkdir_p(output_dir_path)

Dir.glob("#{input_dir_path}/*.json").each do |input_file_path|
  begin
    puts "Converting #{input_file_path}..."
    output_file_path = File.join(output_dir_path, File.basename(input_file_path, '.json') + '.csv')
    Converter::Base.new(input_file_path, output_file_path).call
    puts "Done"
  rescue StandardError => e
    puts "Error converting #{input_file_path}: #{e.message}"
  end
end
