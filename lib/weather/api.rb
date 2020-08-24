
class API
  def self.get_weather(input)
    key = "afa65c1e7de939222778e4e17db0f444"
    url = "https://api.openweathermap.org/data/2.5/weather?zip=#{input}&appid=#{key}"
    response = HTTParty.get(url)
    response["main"]
    # binding.pry
    response["main"].each do |k,v|
      Weather.new(k,v)
    end
  end
end
