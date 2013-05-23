# Cinch::Plugins::Wikipedia

[![Code Climate](https://codeclimate.com/github/bhaberer/cinch-wikipedia.png)](https://codeclimate.com/github/bhaberer/cinch-wikipedia)

Cinch plugin to query wikipedia.

## Installation

Add this line to your application's Gemfile:

    gem 'cinch-wikipedia'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cinch-wikipedia

## Usage

Just add the plugin to your list:

    @bot = Cinch::Bot.new do
      configure do |c|
        c.plugins.plugins = [Cinch::Plugins::Wikipedia]
      end
    end

Then in channel use .wiki:

    .wiki kitten

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
