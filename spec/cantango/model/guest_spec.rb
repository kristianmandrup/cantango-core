require 'spec_helper'

class Guest
  include CanTango::Model::Guest
end

describe CanTango::Model::Guest do
  subject { Guest.new }
  
  its(:email) { should == 'guest@example.com' }

  specify { subject.has_role?(:guest).should be_true } 
  specify { subject.has_role?(:user).should be_false } 
end
