class Aresta
  attr_accessor :vertice1
  attr_accessor :vertice2
  def initialize(vertice, vertice2)
      self.vertice1 = Vertice.new(vertice)
      self.vertice2 = Vertice.new(vertice2)
  end

end
