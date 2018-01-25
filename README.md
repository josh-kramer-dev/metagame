# Metagame

Welcome to the Magic the Gathering(MtG) Metagame Gem. This gem is designed to scrape data from a leading website for MtG metagame information, and allow the user to interact with that information. They will be able to see prices, popularity, and get a link to the most popular decks of the day for both the Standard and Modern format.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'metagame'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install metagame

## Usage

To use this gem, you will need to run the executable file, located in ./bin/metagame.

You will then be prompted to pick a format of MtG. Once you have picked the format, a list of the popular decks of the day within that format will be displayed. You will then have the option to pick one of those decks to get a closer look, display the entire list again, choose a format again, or exit the application.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/funemployeddad@gmail.com/metagame. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Metagame project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/funemployeddad@gmail.com/metagame/blob/master/CODE_OF_CONDUCT.md).
