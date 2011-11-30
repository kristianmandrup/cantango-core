require 'spec_helper'

class MyFilter < CanTango::Filter::Base
  def initialize item, list
    super
  end
end

describe CanTango::Filter::Base do
  context "a and list of a,b,c" do
    before do
      @list = ['a', 'b', 'c'] 
    end
    subject { MyFilter.new 'a', @list }
  
    its(:include_list) { should == @list.map(&:to_sym) }
    its(:item) { should == :a }
  
    its(:valid?) { should be_true }
    its(:in_include_list?) { should be_true }

    its(:not_only?) { should be_false }
    its(:excluded?) { should be_false }
  end
end
