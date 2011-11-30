require 'spec_helper'
require 'fixtures/models'

describe CanTango::Ability::Cache::SimpleKey do
  before do
    @user = User.new 'krisy', 'krisy@gmail.com'
    @account = Account.new user
    @ability = CanTango::Ability::Base.new @account
  end

  context 'SimpleKey for user' do
    subject { CanTango::Ability::Cache::SimpleKey.new @user }

    specify do
      subject.value.should == @user.email.hash
    end
    
    specify do
      subject.to_s.should match /#{@user.email.hash}/
  end
    
  context '#Simplekey #create_for Ability' do
    subject { CanTango::Ability::Cache::SimpleKey.create_for @ability }

    specify do
      subject.value.should == @user.email.hash
    end
  end
end