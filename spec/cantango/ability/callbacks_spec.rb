require 'spec_helper'
require 'fixtures/models'

module CanTango::Ability
  class Base
    include CanTango::Ability::Callbacks

    before_execute :add_x
    after_execute :add_y
    
    def execute
      within_callbacks do
        clear_rules!
        calculate_rules
      end
    end
    
    protected
    
    def buffer
      @buffer ||= ""
    end
    
    def add_x
      buffer << 'x'
    end

    def add_y
      buffer << 'y'
    end
  end
end

describe CanTango::Ability::Callbacks do
  before do
    @user = User.new 'admin', 'admin@mail.ru'
  end

  subject { CanTango::Ability::Base.new @user }

  describe 'handle_callbacks :before' do
    its(:buffer) { should match /x/ }
  end

  describe 'handle_callbacks :after' do
    its(:buffer) { should match /y/ }
  end
end
