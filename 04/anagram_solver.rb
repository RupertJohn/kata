class AnagramSolver

    def initialize(word_file)
        words = File.open(word_file, 'r').readlines
        build_anagram_hash words
    end

    def find_anagram(word)
        anagram_hash[word.gsub(/[^a-zA-Z]/, '').downcase.chars.sort.join]
    end

    private
        attr_accessor :anagram_hash

        def build_anagram_hash(words)
            @anagram_hash = words.each_with_object({}) do |word, hash|
                sorted_word = word.downcase.gsub(/[^a-zA-Z]/, '').chars.sort.join
                cleaned_word = word.gsub("\n", '')
                hash[sorted_word] ? hash[sorted_word] << cleaned_word : hash[sorted_word] = [cleaned_word]
            end
        end
end
