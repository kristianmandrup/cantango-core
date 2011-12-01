require 'spec_helper'

describe CanTango::Loader::Yaml do
  subject { CanTango::Loader::Yaml.new File.join(spec_folder, 'fixtures/test.yml')  }
  
  describe 'Parser not implemented' do
    specify do
      lambda { subject.parser }.should raise_error
    end
  end

  its(:yml_content) { should be_a Hash }
end
