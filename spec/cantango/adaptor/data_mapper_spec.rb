# This is used to wrap the CanCan ORM adapters, that enable convenient 
# 'simple' queries using hashes similar to 'metawhere' gem
require 'spec_helper'

class Chair
  include DataMapper::Resource
end

module CanTango::Ability
  class Base
    def calculate_rules
      can :read, Chair, :owner => user
    end
  end
end


describe CanTango::Adaptor::DataMapper do
  before do
    @user = User.new 'admin', 'admin@mail.ru'
    @stranger = User.new 'stranger', 'stranger@mail.ru'
    
    @chair = Chair.create :owner => @user
    @chair.owner = @user
  end

  context 'subject is owner of poster' do
    subject { CanTango::Ability::Executor::Base.new @user }
  
    specify { subject.should be_allowed_to(:read, @chair) }
  end
  
  context 'subject is NOT owner of poster' do
    subject { CanTango::Ability::Executor::Base.new @stranger }

    specify { subject.should_not be_allowed_to(:read, @chair) }
  end
end

