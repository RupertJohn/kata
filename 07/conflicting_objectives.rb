class ConflictingObjectives
  attr_accessor :grouped_words, :words

  def initialize(file)
    @words = file.read.scan(/^.{1,6}$/)
  end

  def grouped_words
    @grouped_words ||= words.group_by(&:length)
  end
end
