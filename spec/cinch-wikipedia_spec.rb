require 'spec_helper'

describe Cinch::Plugins::Wikipedia do
  include Cinch::Test

  before(:all) do
    @bot = make_bot(Cinch::Plugins::Wikipedia)
  end

  # normal queries
  it 'should return a definition of a term' do
    expect(get_replies(make_message(@bot, '!wiki computer')).first.text)
      .to include('A computer is a general purpose device')
  end

  it 'should return a definition of a term for each version of cmd' do
    msg1 = get_replies(make_message(@bot, '!wiki computer')).first.text
    msg2 = get_replies(make_message(@bot, '!wikipedia computer')).first.text
    expect(msg1).to eq(msg2)
  end

  it 'should not return multiple lined definitions' do
    expect(get_replies(make_message(@bot, '!wiki Teenager')).first.text)
      .to_not include("\n")
  end

  it 'should not return definitions that are longer than 250 chars' do
    expect(get_replies(make_message(@bot, '!wiki Teenager')).first.text.length)
      .to eq 334
  end

  # Not found
  it 'should return an error message when a term is not found' do
    msg = make_message(@bot, '!wiki dasdafasfasfasfasafsdfsdfsadf')
    expect(get_replies(msg).first.text)
      .to include("I couldn't find anything for that search, sorry!")
  end

  it 'should provide suggestions if one is listed on the page' do
    expect(get_replies(make_message(@bot, '!wiki cliinton')).first.text)
      .to include("I couldn't find anything for that search, did you mean 'clinton'?")
  end

  # disambiguation
  it 'should return helful information when a disambuation page' do
    expect(get_replies(make_message(@bot, '!wiki hacker')).first.text)
      .to include('is too vague and lead to a disambiguation page')
  end
end
