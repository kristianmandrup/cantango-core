module CanTango
  module Ability
    class Base
      include CanCan::Ability
      include CanTango::Ability::Rules
      
      attr_reader :options, :candidate

      # Equivalent to a CanCan Ability#initialize call
      # which executes all the permission logic
      def initialize candidate, options = {}
        raise "Candidate must be something!" if !candidate
        @candidate, @options = candidate, options
        execute
      end
      
      def execute
        clear_rules!
        calculate_rules
      end
      
      def session
        @session = options[:session] || {} # seperate session cache for each type of user?
      end

      # Helper.modules.each do |name|
        # include "CanTango::Ability::Helper::#{name.to_s.camelize}".constantize
      # end
    end
  end
end