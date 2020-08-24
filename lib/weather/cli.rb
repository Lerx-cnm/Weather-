class CLI
  def start
    puts "Welcome User"
    puts "Please enter a zipcode to find out weather"
    input = gets.strip
    new_hash = API.get_weather(input)

  end
end
