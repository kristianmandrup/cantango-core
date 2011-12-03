module CanTango
  module Ability
    module Mode
      class Base
        include CanTango::Ability::Executor

        attr_reader :ability

        delegate :session, :user, :subject, :candidate, :cached?, :can?, :cannot?, :to => :ability

        def initialize ability, options = {}
          @ability, @options = [ability, options]
          execute
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