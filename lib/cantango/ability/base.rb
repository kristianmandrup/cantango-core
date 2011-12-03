module CanTango
  module Ability
    class Base
      include CanCan::Ability

      include CanTango::Ability::Rules
      include CanTango::Ability::Callbacks
      include CanTango::Ability::Executor
      
      attr_reader :options, :candidate

      # Equivalent to a CanCan Ability#initialize call
      # which executes all the permission logic
      def initialize candidate, options = {}
        raise "Candidate must be something!" if !candidate
        @candidate, @options = candidate, options
        execute!
      end
      
      def within_callbacks &block
        yield
      end

      # overriden by Engine helper
      def engines_on?
        false
      end

      def cached?
        false
      end

      def session
        @session = options[:session] || {} # seperate session cache for each type of user?
      end

      # overriden by Masquerade helper
      def subject
        candidate
      end

      def config
        CanTango.config
      end

      # Helper.modules.each do |name|
        # include "CanTango::Ability::Helper::#{name.to_s.camelize}".constantize
      # end
    

    end
  end
end