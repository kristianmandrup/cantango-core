require 'spec_helper'

# require 'cantango/core'

describe 'cantango/core' do
  specify do 
    lambda { CanTango }.should_not raise_error
  end
end
