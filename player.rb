class Player
  attr_reader :name, :level
  attr_accessor :point, :coin
  
  def initialize(name, level)
    @name = name
    @level = level
    @point = 0
    @coin = 100
  end

end