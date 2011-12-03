require 'spec_helper'
require 'fixtures/models'

module CanTango::Ability::Mode
  class Cache
    def permit_rules
      can :read, Post
    end
  end
end

module CanTango::Ability::Mode
  class NoCache
    def permit_rules
      can :write, Post
    end
  end
end

describe CanTango::Ability::Executor::Modal do
  before do
    @user = User.new 'admin', 'admin@mail.ru'
  end

  context 'Set execution modes  via :modes option'
    subject do 
      modes_executor = CanTango::Ability::Executor::Modal.new @user
      modes_executor.modes << :no_cache
      modes_executor
    end

    its(:modes)  { should include(:no_cache) }
    its(:non_cached_rules)  { should_not be_empty }

    describe 'rules contain only non-cached rules' do
      specify { subject.rules.size.should == subject.non_cached_rules.size }
      specify { subject.rules.size.should == 1 }
    end
  end

  context 'Set execution modes  via :modes option'
    subject { @CanTango::Ability::Executor::Modal.new @user, :modes => [:no_cache] }

    its(:modes)  { should include(:no_cache) }
  end
end
