class ConflictingObjectives
  def initialize(file)
    @file = file
  end

  def read_words
    @words = file.read
  end

  private

  attr_reader :file, :words
end
