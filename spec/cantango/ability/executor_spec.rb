require 'spec_helper'
require 'fixtures/models'

module CanTango::Ability
  class MyExecutor
    include CanTango::Ability::Executor
  end
end

describe CanTango::Ability::Executor do
  before do
    @user = User.new 'krisy', 'krisy@gmail.com'
    @ability = CanTango::Ability::Base.new @user
  end

  subject { CanTango::Ability::MyExecutor.new @ability }

  describe 'calculate_rules by default returns rules' do
    specify do
      subject.calculate_rules.should == []
    end
  end
  
  describe 'execute by default calls calculate_rules' do
    specify do
      subject.execute.should == []
    end
  end
end
