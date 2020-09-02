class Weather
  @@all = []

  attr_reader :low,  :temp, :high, :humidity, :feels_like, :zipcode
  def initialize(hash, input)
    @zipcode = input
    @low = CLI.conversion(hash["temp_min"])
    @temp = CLI.conversion(hash["temp"])
    @high = CLI.conversion(hash["temp_max"])
    @humidity = hash["humidity"]
    @feels_like = CLI.conversion(hash["feels_like"])
    save
    # binding.pry
  end

  def save
    @@all << self
  end
  def self.all
      @@all
  end
end
