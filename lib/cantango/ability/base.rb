module CanTango
  module Ability
    class Base
      include CanCan::Ability
      include CanTango::Ability::Rules
      
      attr_reader :candidate, :options

      # Equivalent to a CanCan Ability#initialize call
      # which executes all the permission logic
      def initialize candidate, options = {}
        raise "Candidate must be something!" if !candidate
        @candidate, @options = candidate, options
        execute
      end
      
      def execute
        clear_rules!
        calc_rules
      end
      
      # seperate session cache for each type of user?
      def session
        @session ||= options[:session] || {} 
      end
    end
  end
end