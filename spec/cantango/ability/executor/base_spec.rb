require 'spec_helper'
require 'fixtures/models'

module CanTango::Ability
  class Base
    def permit_rules
      can :read, Post
    end
  end
end

describe CanTango::Ability::Executor::Base do
  context 'non-cached only' do
    before do
      @user = User.new 'admin', 'admin@mail.ru'
    end

    subject { CanTango::Ability::Executor::Base.new @user }

    its(:non_cached_rules)  { should_not be_empty }

    describe 'rules contain only non-cached rules' do
      specify { subject.rules.size.should == @abil.non_cached_rules.size }
      specify { subject.rules.size.should == 1 }
    end
  end
end
