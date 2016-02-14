class Employee
  attr_reader :name, :phone_number, :email
  attr_accessor :salary, :review

  def initialize(name, phone_number, email, salary, review = nil, satisfactory = false)
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
end
