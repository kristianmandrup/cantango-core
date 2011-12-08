require 'spec_helper'
require 'fixtures/models'

module CanTango::Ability
  class Base
    include CanTango::Ability::Helper::Account
    
    def calculate_rules
      can :read, Project
      cannot :edit, Project
    end
  end
end

describe CanTango::Scope::Ability do
  before do
    @user = User.new 'krisy', 'kris@gmail.com'
    @ability = CanTango::Ability::Base.new @user
    
    @project = Project.new
  end
  
  subject { CanTango::Scope::Ability.new @ability }
  
  specify do
    subject.can?(:read, @project).should be_true
  end

  specify do
    subject.cannot?(:edit, @project).should be_true
    subject.can?(:edit, @project).should be_false
  end
end
