require 'spec_helper'

class Paper
  include CanTango::Helpers::Debug
end

module Writer
  def self.global_buffer
     @global_buffer ||= ""
   end
 end

describe CanTango::Helpers::Debug do
  before do
    @paper = Paper.new
    @paper.debug_writer = lambda {|m| Writer.global_buffer << m }
    @paper.do_debug = true
  end

  subject { @paper }
  
  describe 'should write to writer' do
    before do
      @paper.debug 'hello'
    end
    
    specify { Writer.global_buffer.should == 'hello'}
  end
end