require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.has_key?(title)
  end

  def >(other_startup)
    @funding > other_startup.funding
  end

  def hire(employee_name, title)
    unless self.valid_title?(title)
      raise "invalid title"
    end

    new_employee = Employee.new(employee_name, title)
    @employees << new_employee
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    employee_salary = @salaries[employee.title]

    if @funding < employee_salary
      raise "insufficient funds"
    end

    employee.pay(employee_salary)
    @funding -= employee_salary
  end

  def payday
    @employees.each { |employee| self.pay_employee(employee) }
  end

  def average_salary
    total = @employees.map { |employee| @salaries[employee.title] }.sum
    total / size
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(other_startup)
    @funding += other_startup.funding
    @salaries = {**other_startup.salaries, **@salaries}
    @employees.concat(other_startup.employees)
    other_startup.close
  end
end
