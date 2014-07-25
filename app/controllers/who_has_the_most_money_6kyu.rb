class Student
  attr_reader :name
  attr_reader :fives
  attr_reader :tens
  attr_reader :twenties

  def initialize(name, fives, tens, twenties)
    @name = name
    @fives = fives
    @tens = tens
    @twenties = twenties
  end

  def most_money(students)
    students = self.all
    students.each do |student|
      total = student.fives * 5 + student.tens * 10 + student.twenties * 20
      if
      return student.name
  end
end
