require 'spec_helper'
require 'fixtures/models'

shared_examples_for CanTango::Ability::Mode::Base do
  before do
    @user = User.new 'admin', 'admin@mail.ru'
    @ability = CanTango::Ability::Base.new @user
  end

  subject { mode_class.new @ability }

  describe 'Does NOT execute on instantiation' do
    specify do
      subject.rules.should == []
    end
  end

  describe 'execute will calculate rules' do
    before do
      subject.execute
    end
    specify { subject.rules.should_not be_empty }
    specify { subject.rules.size.should == 1 }
    specify { subject.rules.first.should be_a CanCan::Rule }
    
    specify { subject.can?(:read, Post).should be_true }
    specify { subject.should be_allowed_to(:read, Post) }
  end
end
