# Validation Module
module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
    base.validations = []
  end

  module ClassMethods
    attr_accessor :validations

    def validate(attr_name, type_valid, param = nil)
      @validations ||= []
      @validations << { attr_name: attr_name, type_valid: type_valid, param: param }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |valid|
        var_name = instance_variable_get("@#{valid[:attr_name]}")
        method_name = valid[:type_valid]
        send(method_name, var_name, *valid[:param])
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    def presence(attr_name)
      raise 'Name of attribute should not be nil!' if attr_name.empty? || attr_name.nil?
    end

    def format
      raise 'Not correct format!' if type_valid !~ param
    end

    def type(_attr_name, param)
      raise 'Not correct type!' if type_valid.class != param
    end
  end
end
