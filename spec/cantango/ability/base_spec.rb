require 'spec_helper'
require 'fixtures/models'

module CanTango::Ability
  class Base
    include CanTango::Ability::Helper::Account
    
    def permit_rules
      can :edit, Project
    end
  end
end

describe CanTango::Ability::Base do
  before do
    user = User.new 'krisy', 'krisy@gmail.com'
    @account = Account.new user
  end

  subject { CanTango::Ability::Base.new @account }

  specify { subject.should be_allowed_to(:edit, Project) }
end
