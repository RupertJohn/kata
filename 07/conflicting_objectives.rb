class ConflictingObjectives
  def initialize(file)
    @file = file
  end

  def read_words
    @words = file.read
  end

  def filter_words!
    self.words = words.scan(/^.{1,6}$/)
  end

  private

  attr_accessor :words
  attr_reader :file
end
