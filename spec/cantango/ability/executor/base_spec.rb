require 'spec_helper'
require 'fixtures/models'

CanTango.configure do |config|
  config.clear!
  config.ability.mode = :no_cache
end

class MyExecutor
  include CanTango::Ability::Executor::Base

  attr_reader :ability

  def initialize ability
    @ability = ability
  end

  def valid?
    true
  end

  def cache_key
    :my_exec
  end

  def permit_rules
    ability.permit_rules
  end
end

module CanTango::Ability
  class Base
    def permit_rules
      can :edit, Project
    end
  end
end

describe CanTango::Ability::Executor::Base do
  context 'no-cache' do
    let (:ability) do
      CanTango::Ability.new @user
    end

    before do
      @user = User.new 'kris'
    end

    subject { MyExecutor.new ability }

    describe '#execute!' do
      before do
        subject.execute!
      end

      specify { subject.ability.send(:rules).should_not be_empty }
    end
  end
end


