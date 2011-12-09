module CanTango::Adaptor
  module Mongoid
    include CanTango::Adaptor::Mongo
    
    def adaptor_type
      :mongoid
    end
  end
end
