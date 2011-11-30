require 'spec_helper'
require 'fixtures/models'

CanTango.configure do |config|
  config.clear!
  config.permits.enabled_types = [:role]
end
CanTango.debug!

class User
  tango_user
  include_and_extend SimpleRoles
end

module CanTango::Ability::Executor
  class CacheMode
    def permit_rules
      can :read, Post
    end
  end
end

module CanTango::Ability::Executor
  class NoCacheMode
    def permit_rules
      can :write, Post
    end
  end
end


describe CanTango::Ability::Executor::Modes do
  context 'non-cached only' do
    before do
      @user = User.new 'admin', 'admin@mail.ru', :role => 'admin'
      @no_cache_executor = CanTango::Ability::Executor::NoCacheMode.new @user
      @modes_executor = CanTango::Ability::Executor::Modes.new @user
    end

    subject do
      @modes_executor.add_mode_executors @no_cache_executor
    end

    its(:non_cached_rules)  { should_not be_empty }

    describe 'rules contain only non-cached rules' do
      specify { subject.rules.size.should == subject.non_cached_rules.size }
      specify { subject.rules.size.should == 1 }
    end
  end
end
