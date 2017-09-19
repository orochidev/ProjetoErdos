require './aresta'
require './vertice'
class Grafo
  attr_accessor :vertices
  attr_accessor :arestas
  attr_accessor :cores
  attr_accessor :precedentes
  attr_accessor :distacia
  attr_accessor :fila

  def initialize
    @listaAdj = {}
    self.vertices = []
    self.arestas = []
  end

  def addVertice(vertice)
    self.vertices << Vertice.new(vertice)
  end

  def addAresta(vertice1, vertice2)
    addVertice(vertice1) unless self.vertices.include? vertice1
    addVertice(vertice2) unless self.vertices.include? vertice2
    aresta = Aresta.new(vertice1, vertice2, self)
    self.arestas << aresta
  end

  def searchAresta(vertice1, vertice2 = nil)
    arestas = nil
    if vertice2 == nil
      aresta = arestas.all{|aresta| aresta.vertice1 == vertice1}
    end

    aresta
  end
  def searchVerticeByRotulo(rotulo)
    self.vertices.find {|vertice| vertice.rotulo == rotulo}
  end

  def verticesAdjacentes(vertice)
    adj = []
    arestas.each do |aresta|
      if aresta.vertice1.equal?(vertice)
        adj << aresta.vertice2
      elsif aresta.vertice2.equal?(vertice)
        adj << aresta.vertice1
      end
    end
    adj
  end

  def buscaEmLargura(verticeInicial)
    distancia = -1
    maxDistancia = 0
    self.vertices.select {|vertice| vertice != verticeInicial}.each do |vertice|
      vertice.cor = :branco
      vertice.distancia = Float::INFINITY
      vertice.predecessor = nil
      vertice
    end

    q = Queue.new
    verticeInicial.cor = :cinza
    verticeInicial.distancia = 0
    verticeInicial.predecessor = nil
    q << verticeInicial

    while !q.empty? do
      u = q.pop
      verticesAdjacentes(u).each do |v|

        if v.cor == :branco
          v.cor = :cinza
          v.distancia = u.distancia + 1
          maxDistancia = v.distancia if v.distancia > maxDistancia
          v.predecessor = u
          q << v
        end

      end
      u.cor = :preto
    end
    maxDistancia
  end

end
