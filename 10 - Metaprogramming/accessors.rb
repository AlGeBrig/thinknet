# Module Accessors
module Accessors
  def self.included(base)
    base.send :extend, ClassMethods
  end

  # Module ClassMethods
  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        var_name_history = "@#{name}_history"
        
        define_method(name) { instance_variable_get(var_name) }
        define_method("#{name}_history") { instance_variable_get(var_name_history) }

        define_method("#{name}=".to_sym) do |value|
          if instance_variable_get(var_name_history).nil?
            instance_variable_set(var_name_history, [])
          else
            old_value = instance_variable_get(var_name)
            instance_variable_get(var_name_history) << old_value
          end
          instance_variable_set(var_name, value)
        end
      end
    end

    def strong_attr_accessor(attr, attr_class)
      attr_name = "@#{attr}".to_sym
      define_method(attr) { instance_variable_get(attr) }

      define_method("#{attr}=".to_sym) do |value|
        raise 'Not correct class of attribute' if value.class != attr_class
        instance_variable_set(attr_name, value)
      end
    end
  end
end
