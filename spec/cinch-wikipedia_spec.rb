require 'spec_helper'

describe Cinch::Plugins::Wikipedia do

  before(:all) do
    @plugin = Cinch::Plugins::Wikipedia.new
  end

  # normal queries
  it 'should return a definition of a term' do
    @plugin.send(:get_def, 'computer').
      should include("A computer is a general purpose device")
  end

  it 'should not return multiple lined definitions'
  it 'should not return definitions that are longer than 300 chars'

  it 'should return an error message when a term is not found' do
    @plugin.send(:get_def, 'dasdafasfasfasfasafsdfsdfsadf').
      should include("I couldn't find anything for that search, sorry!")
  end

  it 'should provide suggestions if one is listed on the page' do
    @plugin.send(:get_def, 'smegama').
      should include("I couldn't find anything for that search, did you mean 'smegma'?")
  end

  it 'should return helful information when a disambuation page'

end
