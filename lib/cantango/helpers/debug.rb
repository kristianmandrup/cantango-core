module CanTango
  module Helpers
    module Debug
      # you can set another writer on CanTango.config.debug, fx to spec it!
      def debug msg
        CanTango.config.debug.write msg if CanTango.debug?
      end
    end
  end
end
