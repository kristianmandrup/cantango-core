module CanTango
  module Filter
    class Base
      attr_reader :item, :include_list

      def initialize item, list = nil
        @item         = item.to_sym
        @include_list = list.map(&:to_sym) || []
      end

      def valid?
        return false if !in_include_list?
        return false if not_only?
        !excluded?
      end

      def in_include_list?
        return false if include_list.blank?
        include_list.include? item
      end

      def not_only?
        false
      end

      def excluded?
        false
      end
    end
  end
end