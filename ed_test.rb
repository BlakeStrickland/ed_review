require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
#Note: This line is going to fail first.
require './department.rb'
require './employee.rb'



class BattleshipTest < Minitest::Test
  def test_01_create_department
    assert Department
    education = Department.new("Education")
    assert_equal "Education", education.dept_name
  end

  def test_02_create_employee
    assert Employee
    blake = Employee.new("Blake", "919-555-5555", "email@email.com", 54000)
    assert_equal "Blake", blake.name
    assert_equal "919-555-5555", blake.phone_number
    assert_equal "email@email.com", blake.email
    assert_equal 54000, blake.salary
  end

  def test_03_employee_belongs_to_department
    education = Department.new("Education")
    blake = Employee.new("Blake", "919-555-5555", "email@email.com", 54000)

    assert_equal [blake], education.add_employees(blake)
  end
end
