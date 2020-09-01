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
      if input.to_i.digits.length != 5
        puts "Please enter a valid US zipcode."
        start
      else
      Weather.new(API.get_weather(input), input)
      response
    end
  end
end

  def self.conversion(input)
    temp1 = (input - 273.15)*9/5 + 32
    temp1.round
  end

  def response
    temps = Weather.all[0]
    # binding.pry
    puts "The temperature is currently #{temps.temp}°F, with the minimum at #{temps.low}°F, and the maximum at #{temps.high}°F\n\n"
    puts "Type 'quit', if you would like to quit the program.\n\n"
  end
end
