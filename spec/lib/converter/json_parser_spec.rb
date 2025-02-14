  # frozen_string_literal: true

require_relative '../../spec_helper'
RSpec.describe Converter::JsonParser do
  let(:input_filepath) { 'spec/input_test/test.json' }

  before do
    FileUtils.mkdir_p('spec/input_test')
    File.write(input_filepath, [{ name: 'Juliette', age: 35 }].to_json)
  end

  after do
    FileUtils.rm_rf('spec/input_test')
  end

  describe '#call' do
    it 'parses JSON file correctly' do
      expect(Converter::JsonParser.new(input_filepath).call).to eq([{ 'name' => 'Juliette', 'age' => 35 }])
    end

    it 'raises error when file is not found' do
      expect {Converter::JsonParser.new('unknown.json').call }.to raise_error(Errno::ENOENT)
    end
  end
end