module CanTango
  module Helpers
    module Debug
      attr_writer :do_debug, :debug_writer
      
      def self.included base
        base.extend ClassMethods
      end
      
      module ClassMethods
        attr_writer :do_debug, :debug_writer

        def debug?
          @do_debug ||= false
        end

        def debug_writer
          @debug_writer ||= lambda {|m| puts m }
        end        
      end
      
      # you can set another writer on CanTango.config.debug, fx to spec it!
      def debug msg
        if debug?
          return debug_writer.write msg if debug_writer.respond_to? :write
          return debug_writer.call(msg) if debug_writer.respond_to? :call
          raise "No debug_writer set!"
        end
      end
      
      def debug?
        @do_debug ||= self.class.debug?
      end
      
      def debug_writer
        @debug_writer ||= self.class.debug_writer
      end
    end
  end
end
