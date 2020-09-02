class CLI

  def start
    input = ""
    puts "Welcome User!"
    until input == "quit"
      puts "Please enter a zipcode to check current weather:"
      input = gets.strip
      break if input == "quit"
      puts "Verifying location...\n\n"
      # binding.pry
      if input.to_i.digits.length != 5
        puts "Please enter a valid US zipcode."
      elsif weather = select(input)
        # binding.pry
        response(weather)
      else
      weather = Weather.new(API.get_weather(input), input)
      response(weather)
    end
  end
end

  def self.conversion(input)
    temp1 = (input - 273.15)*9/5 + 32
    temp1.round
  end

  def response(temps)
    # binding.pry
    puts "The temperature is currently #{temps.temp}°F, with the minimum at #{temps.low}°F, and the maximum at #{temps.high}°F\n\n"
    puts "Type 'quit', if you would like to quit the program.\n\n"
  end

  def select(zip)
    Weather.all.find do |rest|
      rest.zipcode == zip
    end
  end
end
