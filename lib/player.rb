class Player
  attr_accessor :name, :role

  def initialize(name, role)
    @name = name
    @role = role
    @round = 1
  end
end
