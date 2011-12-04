require 'spec_helper'

class CanCanRule
  include CanTango::CanCan::RuleClass
end

describe CanTango::CanCan::RuleClass do
  subject { CanCanRule.new }

  its(:rule_class) { should be_a Class }
end