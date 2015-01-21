require_relative 'has_niklas_left_yet/version'
require 'time'

class HasNiklasLeftYet

  def current_time
    Time.now
  end

  def niklas_leaving_time
    Time.new(2015,01,28,18,00,00)
  end

  def has_niklas_left_yet?
    current_time > niklas_leaving_time
  end

  def answer_to_question
    has_niklas_left_yet? ? say_something("Yes") : say_something("No")
  end

  def say_something(string)
    %x(say "#{string}")
  end

end
