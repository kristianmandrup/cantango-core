describe CanCan::RuleClass do
  subject { CanCan::RuleClass.new }

  its(:block) { should be_nil }
end