describe CanTango::Ability::Executor::Mode::Extractor do
  subject { CanTango::Ability::Executor::Mode::Extractor.new executor }

  let(:executor) { CanTango::Ability::Executor::Modal.new ability, modes, options }

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
