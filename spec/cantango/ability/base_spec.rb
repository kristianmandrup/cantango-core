require 'spec_helper'
require 'fixtures/models'

CanTango.configure do |config|
  config.clear!
  config.engines.all :off
end

describe CanTango::Ability::Base do
  let (:user) do
    User.new 'krisy', 'krisy@gmail.com'
  end

  let (:user_account) do
    ua = UserAccount.new user, :roles => [:editor], :role_groups => [:publishers]
    user.account = ua
  end

  before do
    CanTango.config.clear!
    @ability = CanTango::Ability.new user_account
  end

  specify { CanTango.config.roles.excluded.should be_empty }
  specify { CanTango.config.role_groups.excluded.should be_empty }

  subject { @ability }
    specify { @ability.should be_allowed_to(:read, Comment) }
    specify { @ability.should be_allowed_to(:write, Article) }
    specify { @ability.should_not be_allowed_to(:write, Post) }

    its(:user_account)  { should be_a(UserAccount) }
    its(:user)          { should be_a(User) }

    its(:roles)         { should_not be_empty }
    its(:role_groups)   { should_not be_empty }
end
