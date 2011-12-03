module CanTango
  module Ability
    module Mode
      class InvalidError < StandardError; end
      
      class Base
        include CanTango::Ability::Executor

        attr_reader :ability

        delegate :session, :user, :subject, :candidate,   :to => :ability
        delegate :can, :cannot, :can?, :cannot?, :rules,  :to => :ability

        def initialize ability, options = {}
          @ability, @options = [ability, options]
        end

        def within_callbacks
          handle_callbacks :before
          raise CanTango::Ability::Mode::InvalidError, "Not  valid mode: #{self.class}" if !valid?
          yield
          handle_callbacks :after
          rules
        end

        def valid?
          true
        end
      end
    end
  end
end