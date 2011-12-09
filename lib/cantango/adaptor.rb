module CanTango
  module Adaptor
    autoload_modules :Generic, :Relational, :Mongo
    autoload_modules :ActiveRecord, :DataMapper, :Mongoid, :MongoMapper

    # include adaptor depending on which ORM the object inherits from or includes
    def use_adaptor! base, object
      base.class.send :include, adaptor_for(object)
    end

    def adaptor_for object
      "CanTango::Adaptor::#{orm_for(object).to_s.camelize}".constantize
    end

    def orm_for object
      matching_orm(object) || :generic
    end

    def matching_orm object
      orm = orm_map.select do |orm, const|
        begin
          orm_const = const.constantize
          object.kind_of?(orm_const)
        rescue
          next
        end
      end
      orm.empty? ? nil : orm.keys.first
    end

    def orm_map
      {
        :active_record  => "ActiveRecord::Base",
        :data_mapper    => "DataMapper::Resource",
        :mongoid        => "Mongoid::Document",
        :mongo_mapper   => "MongoMapper::Document"
      }
    end
  end
end

