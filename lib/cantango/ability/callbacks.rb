module CanTango::Ability
  module Callbacks
    extend ActiveSupport::Concern
    include CanTango::Helpers::Debug

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
    def handle_callbacks type
      callbacks_method = "#{type}_execute_callbacks"
      raise ArgumentError, "Not a valid callback type: #{type}" if !self.class.respond_to? callbacks_method
      self.class.send(callbacks_method).each {|callback| send(callback) }
    end

    def within_callbacks &block
      handle_callbacks :before
      yield
      handle_callbacks :after
    end
  end
end