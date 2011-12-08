require 'spec_helper'

module CanTango::Ability
  class Base
    include CanTango::Ability::Helper::Engine
    
    def calculate_rules
      can :edit, Project
    end
  end
end

class MyAccount
end

class User
  attr_accessor :account
end

describe CanTango::Ability::Helper::Engine do
  before do
    @user = User.new
  end
  
  subject do
    CanTango::Ability::Base.new @user
  end

  context 'Ability should have' do
    [:engines, :each_engine, :execute_engines!].each do |method_name|
      describe "#{method_name} method" do
        specify { subject.should respond_to(method_name) }
      end
    end
  end
end
