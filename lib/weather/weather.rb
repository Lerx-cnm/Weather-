
class Weather
  @@all = []

  attr_accessor :name, :url

  def initialize(name,url)
      @name = name
      @url = url
      @@all << self
  end

  def self.all
      @@all
  end
end 
