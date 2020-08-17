class Question 
  def initialize
    @random_number_1 = rand(1...20)
    @random_number_2 = rand(1...20)
  end 
  def ask(name)
    puts "#{name}: What does #{@random_number_1} plus #{@random_number_2} equal?"
  end
  def compare(result)
    @random_number_1 + @random_number_2 == result
  end
end