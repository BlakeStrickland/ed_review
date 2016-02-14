class Employee
  attr_reader :name, :phone_number, :email
  attr_accessor :salary, :review, :satisfactory

  def initialize(name: nil, phone_number: nil, email: nil, salary: nil, review: nil, satisfactory: false)
    @name = name
    @phone_number = phone_number
    @email = email
    @salary = salary
    @review = review
    @satisfactory = satisfactory
  end

  def give_review(p_review)
    self.review = p_review
  end

  def satisfactory_employee(yes_no)
    self.satisfactory = yes_no
  end

  def give_raise(raise_percent)
    if self.satisfactory
      self.salary = (self.salary).to_f + (self.salary * raise_percent)
    end
  end
end
