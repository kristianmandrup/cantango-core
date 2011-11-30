require 'spec_helper'
require 'fixtures/models'

CanTango.configure do |config|
  config.clear!
  config.engines.all :off
end

describe CanTango::Ability::Cache do
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
end