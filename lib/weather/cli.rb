class CLI

  def self.greeting
    puts "Welcome User!"
  end

  def start
    input = ""
    until input == "quit"
      puts "Please enter a zipcode to check current weather:"
      input = gets.strip
      break if input == "quit"
      puts "Verifying location...\n\n"
      # binding.pry
      counter = 0
      if input.to_i.digits.length != 5
        puts "Please enter a valid US zipcode."
        start
      elsif check(input)
        # binding.pry
        rest = select(input)
        response(rest[0])
      else
      Weather.new(API.get_weather(input), input)
      turn = Weather.all[0]
      response(turn)
      counter += 1
    end
  end
end

  def self.conversion(input)
    temp1 = (input - 273.15)*9/5 + 32
    temp1.round
  end

  def response(turn = nil)
    temps = turn
    # binding.pry
    puts "The temperature is currently #{temps.temp}°F, with the minimum at #{temps.low}°F, and the maximum at #{temps.high}°F\n\n"
    puts "Type 'quit', if you would like to quit the program.\n\n"
  end

  def select(zip)
    Weather.all.select do |rest|
      rest.zipcode == zip
    end
  end

  def check(zip)
    Weather.all.any? do |rest|
      rest.zipcode == zip
    end
  end
end
