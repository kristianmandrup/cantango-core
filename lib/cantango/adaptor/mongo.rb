module CanTango::Adaptor
  module Mongo
    #include CanTango::daptor::Generic
    # using #in on Hash (Mongoid query)
    def include_condition attribute, candidate
      { attribute.to_sym.in => candidate.send(attribute) }
    end

    def attribute_condition attribute, user_scope
      { attribute.to_sym => candidate.send(attribute) }
    end
  end
end
