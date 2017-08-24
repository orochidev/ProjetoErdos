class Vertice
  attr_accessor :cor
  attr_accessor :rotulo
  attr_accessor :predecessor
  def initialize(rotulo)
    self.rotulo = rotulo
  end

  def to_s
    rotulo
  end
end
