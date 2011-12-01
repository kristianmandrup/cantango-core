module CanTango::Ability
  class Base
    module Callbacks
      module ClassMethods
        [:after, :before].each do |type|
          class_eval %{
            def #{type}_execute_callbacks
              @#{type}_execute_callbacks ||= []
            end
  
            def #{type}_execute *callbacks
              @#{type}_execute_callbacks = callbacks.flatten
            end
          }
        end
      end

      # should execute :after_execute callbacks
      def after_execute
        execute_engines! if engines_on?

        self.class.after_execute_callbacks.each {|callback| send(callback) }
      end

      # should execute :before_execute callbacks
      def before_execute
        self.class.before_execute_callbacks.each {|callback| send(callback) }
      end

      def within_callbacks &block
        before_execute
        yield
        after_execute
      end
    end
  end
end