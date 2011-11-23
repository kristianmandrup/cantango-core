module CanTango
  module Api
    autoload_modules :Attributes, :Common, :Options, :User, :UserAccount

    def self.apis
      [:ability, :can, :scope, :session]
    end

    apis.each do |api|
      clazz = api.to_s.camelize
      self.extend "CanTango::Api::#{clazz}::User".constantize
      self.extend "CanTango::Api::#{clazz}::UserAccount".constantize
    end
    
    autoload_modules *apis
  end
end
