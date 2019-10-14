class ConcatenationFinder
  attr_accessor :dictionary

  def initialize(file)
    @dictionary = File.open(file, 'r').readlines.map!(&:strip!)
  end
end
