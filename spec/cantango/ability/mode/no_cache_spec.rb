require 'spec_helper'
require 'fixtures/models'

module CanTango::Ability::Mode
  class NoCache
    def permit_rules
      can :read, Post
    end
  end
end

describe CanTango::Ability::Mode::NoCache do
  context 'no_cached mode only' do
    before do
      @user = User.new 'admin', 'admin@mail.ru'
      @ability = CanTango::Ability::Base.new @user
    end

    subject { CanTango::Ability::Mode::NoCache.new @ability }

    its(:non_cached_rules)  { should be_empty }

    describe 'rules contain only non-cached rules' do
      specify { subject.rules.size.should == @abil.cached_rules.size }
      specify { subject.rules.size.should == 1 }
    end
  end
end

