require 'spec_helper'
require 'fixtures/models'

module CanTango::Ability::Executor
  class Base
    def calc_rules
      can :write, Post
    end
  end
end

describe CanTango::Ability::Executor::Base do
  subject { CanTango::Ability::Executor::Base.new ability }

  let(:ability) { CanTango::Ability::Base.new user }
  let(:user)    { User.new 'admin', 'admin@mail.ru' }

  describe 'should be executable' do
    specify do
      lambda { subject.execute }.should_not raise_error
    end
  end

  describe 'should not have ability' do
    its(:ability) { should be_a CanTango::Ability::Base }

    specify do
      puts subject.ability.inspect
      subject.ability.rules.should_not be_empty
    end
  end
end