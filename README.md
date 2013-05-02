# Cinch::Plugins::Wikipedia

Cinch plugin to query wikipedia.

## Installation

Add this line to your application's Gemfile:

    gem 'cinch-wikipedia'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cinch-wikipedia

## Usage

Just add th plugin to your list:

    c.plugins.plugins = [Cinch::Plugins::Wikipedia]

Then in channel use .wiki:

    .wiki kitten

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
