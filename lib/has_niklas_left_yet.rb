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

  def time_difference
    (niklas_leaving_time.to_i - current_time.to_i).abs
  end

  def time_difference_normal
    "#{days}:#{hours}:#{minutes}"
  end

  def time_difference_spoken
    say_something("#{days} days, #{hours} hours and #{minutes} minutes")
  end

  def link_speech_before_countdown
    if has_niklas_left_yet?
      say_something("Niklas has been gone for")
    else
      say_something("Niklas will be with us for another")
    end
  end

  def link_speech_after_countdown
    if has_niklas_left_yet?
      say_something("Boo hoo hoo. We miss him loads.")
    else
      say_something(random_string)
    end
  end


  private
  def say_something(string)
    %x(say "#{string}")
  end

  def days
    (((time_difference / 60) / 60) / 24)
  end

  def hours
    (((time_difference - (days_to_seconds)) / 60) / 60)
  end

  def minutes
    ((time_difference - (days_to_seconds) - (hours_to_seconds)) / 60)
  end

  def days_to_seconds
    days*60*60*24
  end

  def hours_to_seconds
    hours*60*60
  end

  def random_string
    %w(we_must_make_the_most_of_him
      i_cannot_believe_he_is_leaving_us
      he_will_be_greatly_missed i_hope_he_visits_us
      i_wonder_if_he_will_buy_us_all_a_drink_when_he_leaves
      heroku_will_be_a_better_place
      he_will_be_remembered_forever
      ).sample
  end
end
