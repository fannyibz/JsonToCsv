# frozen_string_literal: true

RSpec.describe Utils::HashHelper do
  let(:sample_hashes) do
    [
      { 'first_name' => 'Juliette', 'last_name' => 'Dumont', 'details' => { 'age' => 30, 'city' => 'Paris', 'career' => { 'profession' => 'Developer' } } },
      { 'first_name' => 'Arnaud', 'last_name' => 'Valton', 'details' => { 'age' => 25, 'city' => 'Nîmes', 'career' => { 'profession': 'Avocat', 'company': 'Cabinet Valton' } } }
    ]
  end

  describe '.get_multiple_hash_keys' do
    it 'returns all unique keys including nested ones' do
      keys = described_class.get_multiple_hash_keys(sample_hashes)
      puts keys
      expect(keys).to match_array(['first_name', 'last_name', 'details.age', 'details.city', 'details.career.profession', 'details.career.company'])
    end
  end
  
  describe '.get_hash_keys' do
    it 'returns flattened keys with dot notation for nested hashes' do
      keys = described_class.get_hash_keys(sample_hashes.first)
      expect(keys).to match_array(['first_name', 'last_name', 'details.age', 'details.city', 'details.career.profession'])
    end
  end

  describe '.get_multiple_hash_values' do
    it 'returns values from all hashes' do
      values = described_class.get_multiple_hash_values(sample_hashes)
      expect(values).to eq([['Juliette', 'Dumont', 30, 'Paris', 'Developer'], ['Arnaud', 'Valton', 25, 'Nîmes', 'Avocat', 'Cabinet Valton']])
    end
  end

  describe '.get_hash_values' do
    it 'returns flattened values from nested hash' do
      values = described_class.get_hash_values(sample_hashes.first)
      expect(values).to eq(['Juliette', 'Dumont', 30, 'Paris', 'Developer'])
    end
  end
end