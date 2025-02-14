# frozen_string_literal: true

RSpec.describe Converter::CsvStorer do
  let(:output_filepath) { 'spec/output_test/test.csv' }
  let(:headers) { ['name', 'age'] }
  let(:lines) { [['Juliette', "35"], ['Alex', "29"]] }

  before do
    FileUtils.mkdir_p('spec/output_test')
  end

  after do
    FileUtils.rm_rf('spec/output_test')
  end

  describe '#call' do
    it 'creates a CSV file with correct headers and lines' do
      Converter::CsvStorer.new(output_filepath, headers, lines).call
      
      csv_content = CSV.read(output_filepath)
      expect(csv_content[0]).to eq(headers)
      expect(csv_content[1]).to eq(lines[0])
      expect(csv_content[2]).to eq(lines[1])
    end
  end
end