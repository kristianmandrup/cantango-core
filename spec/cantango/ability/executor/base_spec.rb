require 'spec_helper'
require 'fixtures/models'

module CanTango::Ability::Executor
  class Base
    def calculate_rules
      puts "calculate_rules"
      can :write, Post
    end
  end
end

describe CanTango::Ability::Executor::Base do
  before do
    @user = User.new 'admin', 'admin@mail.ru'
    @ability = CanTango::Ability::Base.new @user
  end

  subject do 
    CanTango::Ability::Executor::Base.new @ability
  end

  describe 'should not be executable' do
    specify do
      lambda { subject.execute }.should raise_error
    end
  end

  describe 'should not have ability' do
    specify do
      lambda { subject.ability }.should raise_error
    end
  end
end