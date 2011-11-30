require 'spec_helper'
require 'fixtures/models'

module CanTango::Ability::Executor
  class NoCacheMode
    def permit_rules
      can :read, Post
    end
  end
end

describe CanTango::Ability::Executor::NoCacheMode do
  context 'no_cached mode only' do
    before do
      CanTango.configure.ability.mode = :cache

      @user = User.new 'admin', 'admin@mail.ru', :role => 'admin'
      @ability = CanTango::Ability::Base.new @user
    end

    subject { CanTango::Ability::Executor::NoCacheMode.new @ability }

    its(:non_cached_rules)  { should be_empty }

    describe 'rules contain only non-cached rules' do
      specify { subject.rules.size.should == @abil.cached_rules.size }
      specify { subject.rules.size.should == 1 }
    end
  end
end

