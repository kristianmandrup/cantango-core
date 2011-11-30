module CanTango
  module Ability
    class Base
      include CanCan::Ability

      attr_reader :options, :candidate

      # Equivalent to a CanCan Ability#initialize call
      # which executes all the permission logic
      def initialize candidate, options = {}
        raise "Candidate must be something!" if !candidate
        @candidate, @options = candidate, options

        clear_rules!
        permit_rules

        execute_engines! if engines_on?
      end

      # overriden by Engine helper
      def engines_on?
        false
      end

      def cached?
        false
      end

      def rules
        @rules
      end

      # developer can add rules here to be included in all subclasses!
      def permit_rules
      end

      def clear_rules!
        @rules ||= default_rules
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
    
      protected

      def default_rules
        []
      end
    end
  end
end