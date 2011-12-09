module CanTango::Adaptor
  module ActiveRecord
    include CanTango::Adaptor::Relational
    
    def adaptor_type
      :active_record
    end
  end
end

