class Employee
  attr_reader :name, :phone_number, :email, :salary
  def initialize(name, phone_number, email, salary)
    @name = name
    @phone_number = phone_number
    @email = email
    @salary = salary
  end
end
