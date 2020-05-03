# Validation Module
module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # ClassMethods Module
  module ClassMethods
    attr_reader :validations

    def validate(attr_name, type_valid, *param)
      @validations ||= []
      hasher = {
        attr_name: attr_name,
        type_valid: type_valid,
        param: param
      }
      @validations << hasher
    end
  end

  # InstanceMethods Module
  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    private

    def validate!
      self.class.validations.each do |valid|
        var_name = instance_variable_get("@#{valid[:attr_name]}")
        method_name = valid[:type_valid]
        send(method_name, var_name, *valid[:param])
      end
    end

    def valid_presence(value)
      raise 'Name of attribute should not be nil!' if value.empty? || value.nil?
    end

    def valid_format(value, format)
      raise 'Not correct format!' if value !~ format
    end

    def valid_type(value, klass)
      raise 'Not correct type!' if value.class != klass
    end
  end
end
