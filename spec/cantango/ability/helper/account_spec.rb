require 'spec_helper'

module CanTango::Ability
  class Base
    include CanTango::Ability::Helper::Account
    
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

describe CanTango::Ability::Helper::Account do
  before do
    @user = User.new
    @account = MyAccount.new
    @user.account = @account
  end
  
  subject do
    CanTango::Ability::Base.new @user
  end

  context 'Ability should have' do    
    describe '#account method' do
      specify { subject.account.should == @account }
    end
  end
end

