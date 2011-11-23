module CanTango
  module Api
    module UserAccount
      module All
        def self.included base
          apis.each do |api|
            base.send :include, clazz(api)
          end
        end

        def self.apis
          [:ability, :can, :scope, :session]
        end

        def clazz api
          "CanTango::Api::#{api.to_s.camelize}::UserAccount".constantize
        end
      end
    end
  end
end

