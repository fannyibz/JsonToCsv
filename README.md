# JSON to CSV Converter

A Ruby application that converts JSON files containing arrays of objects into CSV files. Each line in the output CSV represents one object from the JSON input.

## Requirements

- Ruby 3.0.0 or higher
- Bundler

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/json2csv.git
cd json2csv
```

2. Install dependencies:
```bash
bundle install
```

## Usage

### Basic Usage

Run the converter with input and output directory paths:
```bash
ruby lib/main.rb [input_directory] [output_directory]
```

Example:
```bash
ruby lib/main.rb ./input_json_files ./output_csv_files
```

### Input Format

The application expects JSON files containing arrays of objects. Each object should follow this schema:

```graphql
type Profile {
  id: String!
  email: String!
  tags: [String]
  profiles: [SocialProfile]
}

type SocialProfile {
  id: String!
  picture: String
}
```

Example input JSON:
```json
[
  {
    "id": "123",
    "email": "user@example.com",
    "tags": ["student", "engineering"],
    "profiles": [
      {
        "id": "456",
        "picture": "https://example.com/pic.jpg"
      }
    ]
  }
]
```

### Output Format

The converter will create CSV files with:
- Headers based on the JSON object keys
- One row per JSON object
- Arrays and nested objects are flattened

Example output CSV:
```csv
id,email,tags,profiles_id,profiles_picture
123,user@example.com,"student,engineering",456,https://example.com/pic.jpg
```

### Error Handling

The application will:
- Create the output directory if it doesn't exist
- Skip invalid JSON files with error messages
- Continue processing remaining files if one fails

## Development

### Running Tests

Run all tests:
```bash
bundle exec rspec
```

Run specific test file:
```bash
bundle exec rspec spec/lib/converter/base_spec.rb
```

