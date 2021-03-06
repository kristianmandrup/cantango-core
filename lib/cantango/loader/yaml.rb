module CanTango
  module Loader
    class Yaml
      attr_accessor :file_name

      def initialize file_name
        @file_name = file_name
      end

      def self.inherited subclass
        subclass.extend ClassMethods
      end

      def parser
        raise NotImplementedError
      end

      def yml_content
        YAML.load_file(file_name)
      rescue
        raise "Couldn't load YAML file: #{file_name}"
      end
      
      module ClassMethods
      end
    end
  end
end