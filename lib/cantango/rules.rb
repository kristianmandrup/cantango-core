module CanTango
  module Rules
    autoload_modules :Adaptor, :Dsl, :RuleClass, :Scope, :UserRelation

    include Dsl
    include CanCan::Ability
  end
end
