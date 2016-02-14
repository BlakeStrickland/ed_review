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
  end
end
