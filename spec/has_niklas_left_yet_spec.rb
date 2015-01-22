require 'spec_helper'
require 'has_niklas_left_yet'

describe HasNiklasLeftYet do

  let(:countdown) {HasNiklasLeftYet.new}

  it 'knows the current time' do
    expect(countdown.current_time.strftime("%H:%M:%s"))
      .to eq(Time.now.strftime("%H:%M:%s"))
  end

  it 'knows when Niklas is leaving' do
    expect(countdown.niklas_leaving_time).to eq(Time.new(2015,01,28,18,00,00))
  end

  it 'knows whether Niklas has left yet' do
    Delorean.time_travel_to(Time.utc(2015,01,21,17,30))
    expect(countdown.has_niklas_left_yet?).to eq(false)
  end

  it 'knows whether Niklas has left yet' do
    Delorean.time_travel_to(Time.utc(2015,02,21,17,30))
    expect(countdown.has_niklas_left_yet?).to eq(true)
  end

  it 'says that Niklas has not left if he is still here' do
    Delorean.time_travel_to(Time.utc(2015,01,21,17,30))
    expect(countdown).to receive(:`).with('say "No"')
    countdown.answer_to_question
  end

  it 'says that Niklas has left if he is still here' do
    Delorean.time_travel_to(Time.utc(2015,02,21,17,30))
    expect(countdown).to receive(:`).with('say "Yes"')
    countdown.answer_to_question
  end

  it 'knows the difference between Niklas leaving and current time' do
    Delorean.time_travel_to(Time.utc(2015,01,21,17,30))
    expect(countdown.time_difference.to_i)
      .to eq(606600)
  end

  it 'can convert the difference in time into days, hours and minutes' do
    Delorean.time_travel_to(Time.utc(2015,01,21,17,30))
    expect(countdown.time_difference_normal).to eq("7:0:30")
  end

  it 'can says how long Niklas has left' do
    Delorean.time_travel_to(Time.utc(2015,01,21,17,30))
    expect(countdown).to receive(:`)
      .with('say "7 days, 0 hours and 30 minutes"')
    countdown.time_difference_spoken
  end

end
