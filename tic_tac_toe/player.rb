class Player
  attr_reader :name, :score, :sign
  @@active = ''
  @@instances = []
  def initialize(attrs = {})
    @name = attrs[:name]
    @sign = attrs[:sign]
    @@instances << self
  end

  def self.active_player
    @@active
  end

  def self.next_player
    @@active = @@instances.first == @@active ? @@instances.last : @@instances.first
  end
end
