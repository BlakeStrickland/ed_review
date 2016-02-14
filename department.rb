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

end
