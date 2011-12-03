module CanTango
  module Ability
    module Mode
      class Base
        include CanTango::Ability::Executor

        delegate :session, :user, :subject, :candidate, :cached?, :can?, :cannot?, :to => :ability

        def initialize ability, options = {}
          @ability, @options = [ability, options]
        end

        def within_callbacks
          before_execute
          return if !valid?
          yield 
          after_execute
          rules
        end
      end
    end
  end
end