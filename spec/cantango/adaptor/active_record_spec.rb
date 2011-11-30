# This is used to wrap the CanCan ORM adapters, that enable convenient 
# 'simple' queries using hashes similar to 'metawhere' gem
require 'spec_helper'

class Poster < ActiveRecord::Base
end

module CanTango::Ability
  class Base
    def permit_rules
      can :read, Poster, :owner => user
    end
  end
end


describe CanTango::Adaptor::ActiveRecord do
  before do
    @user = User.new 'admin', 'admin@mail.ru'
    @stranger = User.new 'stranger', 'stranger@mail.ru'
    
    @poster = Poster.create :owner => @user
    @poster.owner = @user
  end

  context 'subject is owner of poster' do
    subject { CanTango::Ability::Executor::Base.new @user }
  
    specify { subject.should be_allowed_to(:read, @poster) }
  end
  
  context 'subject is NOT owner of poster' do
    subject { CanTango::Ability::Executor::Base.new @stranger }

    specify { subject.should_not be_allowed_to(:read, @poster) }
  end
end

