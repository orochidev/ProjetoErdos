require './aresta'
require './vertice'
class Grafo
  attr_accessor :vertices
  attr_accessor :arestas

  def initialize
    @listaAdj = {}
  end
  def addVertice(vertice)

  end
  def addAresta(vertice1, vertice2)
    self.arestas ||= []
    self.arestas << Aresta.new(vertice1, vertice2)
  end

  def searchVerticeByRotulo(rotulo)
    self.vertices.find {|vertice| vertice.rotulo == rotulo}
  end


end
