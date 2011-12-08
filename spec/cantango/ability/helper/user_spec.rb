require 'spec_helper'

class MyAccount
end

class User
  attr_accessor :account
end

module CanTango::Ability
  class Base
    include CanTango::Ability::Helper::User
    
    def calculate_rules
      can :edit, Project
    end
  end
end

describe CanTango::Ability::Helper::User do
  before do
    @user = User.new
  end
  
  subject do
    CanTango::Ability::Base.new @user
  end

  context 'Ability should have' do  
    describe '#user method' do
      specify { subject.user.should == @user }
    end

    describe '#user_key_field' do
      specify { subject.should respond_to(:user_key_field) }
    end
  end
end
