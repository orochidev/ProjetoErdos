require './grafo'


def lerArquivo(caminho)
  retorno = ""
  file = File.new(caminho, "r")
  while (line = file.gets)
    retorno << line
  end
  file.close
  retorno
end

def entradaToGrafo(texto)
  grafo = Grafo.new
  linhas = texto.split("\n")
  numArtigos = linhas[0].to_i
  (1..numArtigos).each do |i|
    nomes = linhas[i].split(", ")
    nomes.each do |nome|
      nomes.each do |nome2|
        grafo.addAresta(nome, 2) if nome != nome2
      end
    end
  end
  grafo
end

grafo = entradaToGrafo(lerArquivo("entrada.txt"))
p grafo.arestas.first.vertice1
