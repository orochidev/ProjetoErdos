require './grafo'


grafo = Grafo.new
grafo.addAresta("A", "B")
grafo.addAresta("B", "G")
grafo.addAresta("G", "D")
grafo.addAresta("D", "C")
grafo.addAresta("E", "G")
grafo.addAresta("G", "F")

inicial = grafo.searchVerticeByRotulo("A")
hash = {}

grafo.vertices.each do |vertice|
  hash[vertice] = grafo.buscaEmLargura(vertice)
end

lol = hash.sort_by{|key, value| value}.first.first
p "A cidade onde deveeria ser inserida é a #{lol.rotulo}"
