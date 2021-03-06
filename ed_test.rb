require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
#Note: This line is going to fail first.
require './department.rb'
require './employee.rb'



class EmployeeDepartmentTest < Minitest::Test
  def test_01_create_department
    assert Department
    education = Department.new("Education")
    assert_equal "Education", education.dept_name
  end

  def test_02_create_employee
    assert Employee
    blake = Employee.new(name: "Blake",phone_number: "919-555-5555",email: "email@email.com", salary: 54000)
    assert_equal "Blake", blake.name
    assert_equal "919-555-5555", blake.phone_number
    assert_equal "email@email.com", blake.email
    assert_equal 54000, blake.salary
  end

  def test_03_employee_belongs_to_department
    education = Department.new("Education")
    blake = Employee.new(name: "Blake",phone_number: "919-555-5555",email: "email@email.com", salary: 54000)

    assert_equal [blake], education.add_employees(blake)
  end

  def test_04_get_employee_name
    blake = Employee.new(name: "Blake",phone_number: "919-555-5555",email: "email@email.com", salary: 54000)
    assert_equal "Blake", blake.name
  end

  def test_05_get_employee_salary
    blake = Employee.new(name: "Blake",phone_number: "919-555-5555",email: "email@email.com", salary: 54000)
    assert_equal 54000, blake.salary
  end

  def test_06_get_department_name
    education = Department.new("Education")
    assert_equal "Education", education.dept_name
  end

  def test_07_get_total_department_salary
    blake = Employee.new(name: "Blake",phone_number: "919-555-5555",email: "email@email.com", salary: 54000)
    fox = Employee.new(name: "Fox",phone_number: "919-555-5555",email: "email@email.com",salary: 10000)
    link = Employee.new(name: "Link",phone_number: "919-555-5555",email: "email@email.com",salary: 100000)
    education = Department.new("Education")
    education.add_employees(blake)
    education.add_employees(fox)
    education.add_employees(link)
    assert_equal 164000, education.total_department_salary
  end

  def test_08_give_employee_review
    blake = Employee.new(name: "Blake",phone_number: "919-555-5555",email: "email@email.com", salary: 54000)
    blake.give_review("awesome")
    assert_equal "awesome", blake.review
  end

  def test_09_satisfaction_employee
    blake = Employee.new(name: "Blake",phone_number: "919-555-5555",email: "email@email.com", salary: 54000)
    link = Employee.new(name: "Link",phone_number: "919-555-5555",email: "email@email.com",salary: 100000)
    blake.satisfactory_employee(true)
    assert_equal false, link.satisfactory_employee(false)
    assert_equal true, blake.satisfactory_employee(true)
  end

  def test_10_give_raise
    blake = Employee.new(name: "Blake",phone_number: "919-555-5555",email: "email@email.com", salary: 54000)
    link = Employee.new(name: "Link",phone_number: "919-555-5555",email: "email@email.com",salary: 100000)
    blake.satisfactory_employee(true)
    blake.give_raise(0.10)
    link.give_raise(0.10)

    assert_equal 59400.0, blake.salary
    assert_equal 100000, link.salary
  end

  def test_11_give_department_raise
    blake = Employee.new(name: "Blake",phone_number: "919-555-5555",email: "email@email.com", salary: 54000)
    fox = Employee.new(name: "Fox",phone_number: "919-555-5555",email: "email@email.com",salary: 10000)
    link = Employee.new(name: "Link",phone_number: "919-555-5555",email: "email@email.com",salary: 100000)
    education = Department.new("Education")
    education.add_employees(blake)
    education.add_employees(fox)
    education.add_employees(link)
    blake.satisfactory_employee(true)
    fox.satisfactory_employee(true)

    education.give_total_department_raise(10000)

    assert_equal 59000, blake.salary
    assert_equal 15000, fox.salary
    assert_equal 100000, link.salary
  end

  def test_12_block_for_dept_raises
    blake = Employee.new(name: "Blake",phone_number: "919-555-5555",email: "email@email.com", salary: 54000)
    fox = Employee.new(name: "Fox",phone_number: "919-555-5555",email: "email@email.com",salary: 10000)
    link = Employee.new(name: "Link",phone_number: "919-555-5555",email: "email@email.com",salary: 100000)
    education = Department.new("Education")
    array = [blake, fox, link]
    education.use_block_for_dept_raise(array, 10000) {|up_for_raise| up_for_raise.each do |x|
                                if x.satisfactory && x.salary < 75000
                                  up_for_raise << x
                                end
                              end
                              }
    assert_equal 59000, blake.salary
    assert_equal 15000, fox.salary
    assert_equal 100000, link.salary
  end
end
