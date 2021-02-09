class Employee
    attr_reader :name, :title , :salary , :boss

    def initialize(name,title,salary,boss)
        @name = name
        @title=title
        @salary=salary
        @boss=boss
    end

    def bonus(multiplier)
       @salary * multiplier 
    end

end

class Manager < Employee
    attr_reader :employees

    def initialize(name,title,salary,boss)
        @employees = []

    end

    def bonus(multiplier)
        sum = 0
        @employees.each do |employee|
            if employee.is_a?(Manager)
                sum += self.bonus(employee)
            else
           sum += employee.salary 
            end
        end
        sum
    end
end

employee1=Employee.new('Dave',"director",'5000','John')
manager1=Manger.new('john', 'manager', '10000')
