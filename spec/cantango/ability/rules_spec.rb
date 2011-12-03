require 'spec_helper'
require 'fixtures/models'

module CanTango::Ability
  class Base
    include CanTango::Ability::Rules
    
    def calculate_rules
      can :edit, Project
    end
  end
end

describe CanTango::Ability::Rules do
  before do
    @user = User.new 'krisy', 'krisy@gmail.com'
  end

  subject { CanTango::Ability::Base.new @user }

  describe 'rules' do
    specify do 
      subject.rules.should == []
    end
  end

  describe 'clear_rules!' do
    before do
      subject.rules = [1]
      subject.clear_rules!
    end

    specify do 
      subject.rules.should == []
    end
  end
  
  describe 'normalize_rules!' do
    before do
      subject.rules = [[1,2], 3]
      subject.normalize_rules!
    end

    specify do 
      subject.rules.should == [1,2,3]
    end
  end
end
