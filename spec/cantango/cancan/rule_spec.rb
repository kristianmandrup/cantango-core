require 'spec_helper'
require 'fixtures/models'

describe CanCan::Rule do
  subject { CanCan::Rule.new :read, User, 1, 2, 3 }

  describe 'block' do
    before do
      subject.block = lambda { puts hello }
    end
    specify { subject.block.should respond_to(:call) }
  end
end