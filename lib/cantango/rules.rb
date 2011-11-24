module CanTango
  module Rules
    autoload_modules :Adaptor, :Dsl, :RuleClass, :Scope, :Relation

    include Dsl
    include CanCan::Ability
  end
end
