module CanTango::Adaptor
  module Relational
    def attribute_condition attribute, candidate
      { attribute.to_sym => candidate.send(attribute) }
    end
    alias_method :include_condition, :attribute_condition
  end
end
