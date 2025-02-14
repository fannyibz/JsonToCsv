# Json2Csv

This repository is part of: [MyJobGlasses](https://www.myjobglasses.com/) - Technical Test

The goal of this test is to write a small Ruby lib aiming to convert JSON files composed of arrays of objects (all following the same schema) to a flat CSV file where one line equals one object.

## Test instructions

Here is the input schema (GraphQL-like) of what our app is expected to process correctly

```
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

Some sample files are located in `./input_json_files` and  `./output_csv_files`, they are user provided files from the internet

You can start by writing a `main.rb` (feel free to change this name) that will perform the conversion when running `ruby main.rb [input_dir] [output_dir]` of all the files of the input directory into the output dir

## Test rating criteria

- clean
- extensible
- robust (don't overlook edge cases, use exceptions where needed, ...)
- tested

You have no limitation of time, what we expect is to have a discussion about your choices and your code implementation.

To share your code, it's your choice again: send us a zip or a GitHub link!

Good luck!
