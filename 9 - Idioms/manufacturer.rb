module Manufacturer
  attr_accessor :company
  def name_company
    puts "Произведено компанией #{company}"
    validate!
  end

  def validate!
    raise 'Название компании не может содержать меньше 3 символов ' if @company.length <= 3
  end
end
