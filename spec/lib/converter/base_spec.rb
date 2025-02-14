# frozen_string_literal: true

RSpec.describe Converter::Base do
  let(:input_filepath) { 'spec/input_test/test.json' }
  let(:output_filepath) { 'spec/output_test/test.csv' }
  let(:json_content) { [{ name: 'Juliette', age: 35 }, { name: 'Alex', age: 29 }] }

  before do
    FileUtils.mkdir_p('spec/input_test')
    FileUtils.mkdir_p('spec/output_test')
    File.write(input_filepath, json_content.to_json)
  end

  after do
    FileUtils.rm_rf('spec/input_test')
    FileUtils.rm_rf('spec/output_test')
  end

  describe '#call' do
    it 'converts JSON to CSV successfully' do
      Converter::Base.new(input_filepath, output_filepath).call

      csv_content = CSV.read(output_filepath)
      expect(csv_content[0]).to match_array(['name', 'age'])
      expect(csv_content[1]).to match_array(['Juliette', '35'])
      expect(csv_content[2]).to match_array(['Alex', '29'])
    end

    it 'handles empty JSON array' do
      File.write(input_filepath, [].to_json)
      
      expect {
        Converter::Base.new(input_filepath, output_filepath).call
      }.not_to raise_error
    end

    it 'raises error when input file is not found' do
      expect {
        Converter::Base.new('nonexistent.json', output_filepath).call
      }.to raise_error(Errno::ENOENT)
    end
  end
end