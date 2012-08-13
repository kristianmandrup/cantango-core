require 'spec_helper'
require 'fixtures/models'

module CanTango::Ability::Mode
  class NoCache
    def calculate_rules
      can :write, Post
    end
  end
end

describe CanTango::Ability::Executor::Modal do
  subject { CanTango::Ability::Executor::Modal.new ability, modes, options }

  let(:ability) { CanTango::Ability::Base.new user }
  let(:user)    { User.new 'admin', 'admin@mail.ru' }

  let(:modes)   { [:cache] }
  let(:options) do 
    {:as => :lucky }
  end

  context 'basic config' do
    describe '.init' do
      its(:ability) { should == ability }
      its(:options) { should == {:as => :lucky} }
    end

    describe '.extract' do
      its(:extract) { should == [:cache] }
    end
  end

  context 'modes option' do
    let(:options) do 
      {:modes => [:no_cache] }
    end

    describe '.init' do
      its(:ability) { should == ability }
      its(:options) { should == {:as => :lucky, :modes => [:no_cache]} }
    end

    describe '.extract' do
      its(:extract) { should == [:cache, :no_cache] }
    end
  end
end


describe CanTango::Ability::Executor::Modal do
  before do
    @user = User.new 'admin', 'admin@mail.ru'
    @ability = CanTango::Ability::Base.new @user
  end

  context 'Build using build method with candidate' do
    subject do 
      CanTango::Ability::Executor::Modal.build @user, :modes => [:no_cache]
    end

    specify { subject.ability.should be_a CanTango::Ability::Base }

    specify { subject.candidate.should be_a User }

    describe 'candidate' do
      it 'should be the user' do
        subject.candidate.should == @user
      end
    end

    describe 'ability candidate' do
      it 'should be the user' do
        subject.ability.candidate.should == @user
      end
    end

    specify { subject.modes.should == [:no_cache] }
    specify { subject.options[:modes].should == [:no_cache] }
    specify { subject.should respond_to :can? }
    specify { subject.can?(:write, Post).should be_true }
    specify { subject.can?(:publish, Post).should be_false }
  end

  context 'Set execution mode to :no_cache using option' do
    subject do 
      CanTango::Ability::Executor::Modal.new @ability, :modes => [:no_cache]
    end

    specify { subject.ability.should be_a CanTango::Ability::Base }

    describe 'ability' do
      it 'should be the ability passed in' do
        subject.ability.should == @ability
      end
    end

    specify { subject.candidate.should be_a User }

    describe 'candidate' do
      it 'should be the user' do
        subject.candidate.should == @user
      end
    end

    describe 'ability candidate' do
      it 'should be the user' do
        subject.ability.candidate.should == @user
      end
    end

    
    specify { subject.modes.should == [:no_cache] }
    specify { subject.options[:modes].should == [:no_cache] }
    specify { subject.should respond_to :can? }
    specify { subject.can?(:write, Post).should be_true }
    specify { subject.can?(:publish, Post).should be_false }
  end

  context 'Set execution mode to :no_cache' do
    subject do 
      CanTango::Ability::Executor::Modal.new @ability, :no_cache
    end

    specify { subject.should respond_to :can? }
    specify { subject.should respond_to :cannot? }

    describe 'ability' do
      it 'should be the ability passed in' do
        subject.ability.should == @ability
      end
    end

    describe 'candidate' do
      it 'should be the user' do
        subject.candidate.should == @user
      end
    end

    specify { subject.modes.should include(:no_cache) }

    describe 'rules should have been calculated' do
      specify { subject.rules.should_not be_empty }
      specify { subject.rules.size.should == 1 }
      specify { subject.rules.first.should be_a CanCan::Rule }
      specify { subject.can?(:write, Post).should be_true }
    end
  end
end