class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss = nil)
    @employees = []
  end

  def add_employee(subordinate)
      @employees << subordinate
  end

  def bonus(multiplier)
    self.totalsum * multiplier
  end

  def totalsum
    totalsum = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        totalsum += employee.salary + employee.totalsum
      else
         totalsum += employee.salary
      end
    end
    totalsum
  end



end

manager1 = Manager.new("john", "manager", 10000)
employee1 = Employee.new("Dave", "director", 5000, manager1)
manager1.add_employee(employee1)
# p manager1.employees
p employee1.bonus(5)
p manager1.bonus(10)
