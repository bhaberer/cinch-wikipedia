require 'spec_helper'

describe Cinch::Plugins::Wikipedia do
  include Cinch::Test

  before(:all) do
    @bot = make_bot(Cinch::Plugins::Wikipedia)
  end

  # normal queries
  it 'should return a definition of a term' do
    get_replies(make_message(@bot, '!wiki computer')).first.text.
      should include("A computer is a general purpose device")
  end

  it 'should not return multiple lined definitions' do
    get_replies(make_message(@bot, '!wiki Teenager')).first.text.
      should_not include("\n")
  end

  it 'should not return definitions that are longer than 250 chars' do
    get_replies(make_message(@bot, '!wiki Teenager')).first.text.length.
      should == 334
  end

  # Not found
  it 'should return an error message when a term is not found' do
    get_replies(make_message(@bot, '!wiki dasdafasfasfasfasafsdfsdfsadf')).first.text.
      should include("I couldn't find anything for that search, sorry!")
  end

  it 'should provide suggestions if one is listed on the page' do
    get_replies(make_message(@bot, '!wiki smegama')).first.text.
      should include("I couldn't find anything for that search, did you mean 'smegma'?")
  end

  # disambiguation
  it 'should return helful information when a disambuation page' do
    get_replies(make_message(@bot, '!wiki hacker')).first.text.
      should include('is too vague and lead to a disambiguation page')
  end
end
