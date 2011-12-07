module CanTango
  module Ability
    module Builder

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def build candidate, options = {}
          self.new build_ability(candidate, options), options
        end

        protected

        def build_ability candidate, options = {}
          CanTango::Ability::Base.new(candidate, options = {})
        end
      end
    end
  end
end