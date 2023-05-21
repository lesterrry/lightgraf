# Lightgraf
[![Gem Version](https://badge.fury.io/rb/lightgraf.svg)](https://badge.fury.io/rb/lightgraf)

Lightweight typography tool for Rails. It handles for you:
- __Quotes__:

    "Alpha", "Бета" and "Omega"\
    `↓`\
    “Alpha”, «Бета» and “Omega”
  
- __Hyphens__:

    Мой номер - +7 (977) 417-50-96\
    `↓` \
    Мой номер — +7 (977) 417-50-96

- __Spaces__:

    А что я? А я ничего\
    `↓` \
    А(NBSP)что я?(NBSP)А(NBSP)я(NBSP)ничего
    
- __No-breakables__:

    Call me: 232-12-34\
    `↓` \
    Call me: \<nobr\>232-12-34\</nobr\>

It is fast and efficient, handling complex text of ~5800 characters at 0.06 sec

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lightgraf'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install lightgraf

## Usage

```ruby
require 'lightgraf'
fixed_text = Lightgraf.fix "My text"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lesterrry/lightgraf.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
