require 'spec_helper'
require 'fixtures/models'

describe CanTango::Ability::Mode::Extractor do
  subject { CanTango::Ability::Mode::Extractor.new modes, options }

  let(:ability) { CanTango::Ability::Base.new user }
  let(:user)    { User.new 'admin', 'admin@mail.ru' }

  let(:modes)   { [:cache] }
  let(:options) do 
    {:as => :lucky }
  end

  context 'basic config' do
    describe '.init' do
      its(:modes)   { should == modes }
      its(:options) { should == options }
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
      its(:modes)   { should == modes }
      its(:options) { should == options }
    end

    describe '.extract' do
      its(:extract) { should == [:cache, :no_cache] }
    end
  end
end
