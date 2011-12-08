module CanTango
  module Scope
    class Ability
      attr_accessor :ability

      def initialize ability
        @ability = ability
      end

      delegate :can?, :cannot?, :candidate, :options, :modes, :session, :to => :ability
    end
  end
end
 
