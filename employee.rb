class Employee
  attr_reader :name, :phone_number, :email
  attr_accessor :salary, :review

  def initialize(name, phone_number, email, salary, review = nil)
    @name = name
    @phone_number = phone_number
    @email = email
    @salary = salary
  end
end
