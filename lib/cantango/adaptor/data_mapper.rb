module CanTango::Adaptor
  module DataMapper
    include CanTango::Adaptor::Relational
    
    def adaptor_type
      :data_mapper
    end
  end
end
