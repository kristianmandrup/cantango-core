module CanTango::Adaptor
  module MongoMapper
    include CanTango::Adaptor::Mongo

    def adaptor_type
      :mongo_mapper
    end
  end
end
