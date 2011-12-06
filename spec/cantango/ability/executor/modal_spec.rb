require 'spec_helper'
require 'fixtures/models'

module CanTango::Ability::Mode
  class NoCache
    def calculate_rules
      can :write, Post
    end
  end
end

describe CanTango::Ability::Executor::Modal do
  before do
    @user = User.new 'admin', 'admin@mail.ru'
    @ability = CanTango::Ability::Base.new @user
  end

  context 'Set execution mode to :no_cache' do
    subject do 
      CanTango::Ability::Executor::Modal.new @ability, :no_cache
    end

    specify { subject.should respond_to :can? }
    specify { subject.should respond_to :cannot? }

    describe 'rules should have been calculated' do      
      specify { subject.rules.should_not be_empty }
      specify { subject.rules.size.should == 1 }
      specify { subject.rules.first.should be_a CanCan::Rule }
    end
  end
end