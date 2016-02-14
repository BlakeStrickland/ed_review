require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
#Note: This line is going to fail first.
require './department.rb'
require './employee.rb'



class BattleshipTest < Minitest::Test
  def test_01_create_department
    assert Department
    department = Department.new("Education")
    assert_equal "Education", department.dept_name
  end

  def test_02_create_employee
    assert Employee
    new_employee = Employee.new("Blake", "919-555-5555", "email@email.com", 54000)
    assert_equal "Blake", new_employee.name
    assert_equal "919-555-5555", new_employee.phone_number
    assert_equal "email@email.com", new_employee.email
    assert_equal 54000, new_employee.salary

  end
end
