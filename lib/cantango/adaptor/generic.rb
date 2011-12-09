module CanTango::Adaptor
  module Generic
    def attribute_condition attribute, candidate
      Proc.new { |model| model.send(attribute) == candidate }
    end

    def include_condition attribute, candidate
      Proc.new { |model| model.send(attribute).include? candidate }
    end
    
    def adaptor_type
      :generic
    end    
  end
end
