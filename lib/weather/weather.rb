
class Weather
  @@all = []

  attr_accessor :type, :temp

  def initialize(type, temp)
    @type = type
    @temp = temp
    @@all << self
  end

  def self.all
      @@all
  end
end
