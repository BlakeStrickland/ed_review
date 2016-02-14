class Department
  attr_reader :dept_name
  def initialize(dept_name)
    @dept_name = dept_name
    @employees = []
  end

  def add_employees(new_employee)
    @employees << new_employee
  end

end
