class CLI
  def start
    puts "Welcome User1"
    puts "Please enter a zipcode to check current weather:"
    input = gets.strip
    if input.to_i.digits.length < 5
      puts "Please enter a valid US zipcode:"
      start
    else
    new_hash = API.get_weather(input)
    @@new_hash = new_hash
    puts "Thank you."
    # binding.pry
    end

  end
  def conversion(input)
    puts "Would you like units in Celsius or Farenheit?"
    input1 = gets.strip
    if input1 == "Celsius" || "celsius"
      temp1 = input - 273.15
      response(temp1)
    elsif input1 == "Farenheit" || "farenheit"
      temp1 = (input - 273.15)*(9/5)+32
      response(temp1)
    else
      puts "Please enter a valid answer(Celsius or Farenheit)"
    end

  def response
    puts "The temperature is currently #{conversion(@@new_hash["temp"])}."
  end
end
