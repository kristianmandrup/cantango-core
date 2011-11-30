require 'spec_helper'

module CanTango::Ability
  class Base
    include CanTango::Ability::Helper::User
    
    def permit_rules
      can :edit, Project
    end
  end
end

class MyAccount
end

class User
  attr_accessor :account
end

describe CanTango::Ability::Helper::User do
  before
    @user = User.new
  end
  
  subject do
    CanTango::Ability::Base.new @user
  end
  
  describe 'Ability should have #user method' do
    specify { subject.user.should == @user }
  end
end


