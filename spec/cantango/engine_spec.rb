require 'spec_helper'
require 'fixtures/models'

describe CanTango::Engine do
  before do
    @user = User.new 'admin', 'admin@mail.ru'
    @ability = CanTango::Ability::Base.new @user
  end
  
  context '#initilize with ability' do    
    subject { CanTango::Engine.new @ability }
    
    specify { subject.should be_a CanTango::Engine }
    
    specify do
      lambda { subject.execute! }.should raise_error
    end

    specify do
      lambda { subject.engine_name }.should raise_error
    end

    specify do
      subject.modes.should be_empty
    end
    
    specify do
      subject.valid_mode?(:no_cache).should be_false
    end
  end
  
  context '#initilize with ability and :no_cache mode' do
    subject { CanTango::Engine.new @ability, :modes => [:no_cache] }

    specify do
      subject.modes.should_not be_empty
    end

    specify do
      subject.modes.should include(:no_cache)
    end
    
    specify do
      subject.valid_mode?(:no_cache).should be_true
    end

    specify do
      subject.valid_mode?(:cache).should be_false
    end
  end
end
