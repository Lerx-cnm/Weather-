class CLI
  def greeting
    puts "Welcome User!"
  end
  def start
    puts "Please enter a zipcode to check current weather:"
    input = gets.strip
    puts "Verifying location..."
    if input.to_i.digits.length != 5
      puts "Please enter a valid US zipcode."
      start
    else
    @@new_hash = API.get_weather(input)
    puts "Thank you for waiting."
    response
    end
  end
  def conversion(input)
    temp1 = (input - 273.15)*9/5 + 32
    temp1.round
  end
  def response
    puts "The temperature is currently #{conversion(@@new_hash["temp"])}°F, with the minimum at #{conversion(@@new_hash["temp_min"])}°F, and the maximum at #{conversion(@@new_hash["temp_max"])}°F"
  end
end
