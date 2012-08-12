module CanTango::Ability::Executor
  module Mode
    class Extractor   
      attr_reader :modes, :options

      def initialize executor
        @modes = executor.modes
        @options = executor.options
      end

      def extract 
        raise ArgumentError, "Modes must defined!" if !calc_modes
        raise ArgumentError, "Modes must be a list of modes to execute!" if calc_modes.blank?
        modes
      end

      protected
      
      def calc_modes
        @calc_modes ||= [modes_from_option || modes].flatten
      end

      def modes_from_option
        @options.merge! modes if modes.kind_of?(Hash)
        options[:modes] || options[:mode]
      end
    end
  end
end
