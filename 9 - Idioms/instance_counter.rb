# Module InstanceCounter
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # Module ClassMethods
  module ClassMethods
    attr_writer :instances
    def instances
      @instances ||= 0
    end
  end

  # Module InstanceMethods
  module InstanceMethods
    protected

    def register_instance
      self.class.instances += 1
    end
  end
end
