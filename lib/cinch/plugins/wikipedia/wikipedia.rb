# -*- coding: utf-8 -*-
require 'cinch'
require 'cinch-toolbox'
require 'cinch-cooldown'

module Cinch::Plugins
  class Wikipedia
    include Cinch::Plugin

    enforce_cooldown

    self.help = "Use .wiki <term> to see the Wikipedia info for that term."

    match /wiki (.*)/
    match /wikipedia (.*)/

    def execute(m, term)
      m.reply get_def(term)
    end

    private

    def get_def(term)
      # URI Encode
      term = URI.escape(term, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
      url = "http://en.wikipedia.org/w/index.php?search=#{term}"

      # Grab the text
      text = Cinch::Toolbox.get_html_element(url, '#mw-content-text p')

      # Truncate if it's super long
      text = Cinch::Toolbox.truncate(text, 300)

      return "Wikipedia ∴ #{text} [#{Cinch::Toolbox.shorten(url)}]"
    end
  end
end
