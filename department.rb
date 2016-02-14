require 'byebug'
class Department
  attr_reader :dept_name
  def initialize(dept_name)
    @dept_name = dept_name
    @employees = []
  end

  def add_employees(new_employee)
    @employees << new_employee
  end

  def total_department_salary
    total_salary = []
    @employees.each do |x|
      total_salary << x.salary
    end
    total_salary.reduce {|sum, i| sum + i}
  end

  def give_total_department_raise(amount)
    up_for_raise = []
    @employees.each do |x|
      if x.satisfactory
        up_for_raise << x
      end
    end
    up_for_raise.each do |i|
      i.salary = i.salary + (amount / up_for_raise.length)
    end
  end
end
