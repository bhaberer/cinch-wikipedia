# -*- coding: utf-8 -*-
require 'cinch'
require 'cinch/toolbox'
require 'cinch/cooldown'

module Cinch
  module Plugins
    # Plugin to allow users to search wikipedia.
    class Wikipedia
      include Cinch::Plugin

      enforce_cooldown

      self.help = 'Use .wiki <term> to see the Wikipedia info for that term.'

      match(/wiki(?:pedia)? (.*)/)

      def initialize(*args)
        super
        @max_length = config[:max_length] || 300
      end

      def execute(m, term)
        m.reply wiki(term)
      end

      private

      def wiki(term)
        # URI Encode
        term = URI.escape(term, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
        url = "http://en.wikipedia.org/w/index.php?search=#{term}"

        # Truncate text and url if they are too long
        text = Cinch::Toolbox.truncate(get_def(term, url), @max_length)
        url  = Cinch::Toolbox.shorten(url)

        "Wikipedia ∴ #{text} [#{url}]"
      end

      def get_def(term, url)
        cats = Cinch::Toolbox.get_html_element(url, '#mw-normal-catlinks')
        if cats && cats.include?('Disambiguation')
          return "'#{term} is too vague and lead to a disambiguation page."
        else
          wiki_text = Cinch::Toolbox.get_html_element(url, '#mw-content-text/p')
          if wiki_text.nil?
            return not_found(url)
          end
          return wiki_text
        end
      end

      def not_found(url)
        msg = "I couldn't find anything for that search, "
        alt_term = Cinch::Toolbox.get_html_element(url, '.searchdidyoumean')
        if alt_term
          alt_term = alt_term[/\ADid you mean: (\w+)\z/, 1]
          msg << "did you mean '#{alt_term}'?"
        else
          msg << 'sorry!'
        end
        msg
      end
    end
  end
end
