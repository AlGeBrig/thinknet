# Module Manufacturer
module Manufacturer
  attr_accessor :company
  def name_company
    puts "Произведено компанией #{company}"
    validate!
  end

  def validate!
    if @company.length <= 3
      raise 'Название компании не может содержать меньше 3 символов'
    end
  end
end
