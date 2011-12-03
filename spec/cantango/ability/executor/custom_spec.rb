require 'spec_helper'
require 'fixtures/models'

class MyExecutor < CanTango::Ability::Executor::Base
  attr_reader :ability

  def initialize ability
    super
  end

  def valid?
    true
  end

  def cache_key
    :my_exec
  end

  def calculate_rules
    ability.calculate_rules
  end
end

module CanTango::Ability
  class Base
    def calculate_rules
      can :edit, Project
    end
  end
end

describe CanTango::Ability::Executor::Base do
  context 'Custom executor inheriting from Base' do
    before do
      @user = User.new 'kris'
      @ability = CanTango::Ability::Base.new @user
    end

    subject { MyExecutor.new @ability }

    describe '#execute!' do
      before do
        subject.execute!
      end

      specify { subject.ability.send(:rules).should_not be_empty }
    end
  end
end


