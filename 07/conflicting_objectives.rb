class ConflictingObjectives
  attr_accessor :words

  def initialize(file)
    @words = file.read.scan(/^.{1,6}$/)
  end
end
