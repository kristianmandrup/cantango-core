module CanTango::Ability
  module Mode
    class Extractor   
      attr_reader :modes, :options

      def initialize modes, options
        @modes    = modes
        @options  = options
      end

      def extract 
        raise ArgumentError, "Modes must defined!" if !calc_modes
        raise ArgumentError, "Modes must be a list of modes to execute!" if calc_modes.blank?
        modes
      end

      protected
      
      def calc_modes
        @calc_modes ||= [[options[:modes]] + modes].flatten.compact
      end
    end
  end
end
