require 'spec_helper'
require 'fixtures/models'

module CanTango::Ability
  class Base
    def calculate_rules
      can :edit, Project
      cannot :publish, Project
    end
  end
end

describe CanTango::Ability::Base do
  before do
    @user = User.new 'krisy', 'krisy@gmail.com'
  end

  subject { CanTango::Ability::Base.new @user }

  specify { subject.candidate.should == @user }

  specify { subject.can?(:edit, Project).should be_true }
  specify { subject.cannot?(:publish, Project).should be_true }

  specify { subject.should be_allowed_to(:edit, Project) }
end
