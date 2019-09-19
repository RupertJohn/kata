require 'digest'

class BloomFilter
    attr_accessor :bits
    
    def initialize
        @bits = Array.new(65536,0)
    end

    def insert(item)
        hash = Digest::MD5.hexdigest item
        hash.scan(/.{1,4}/).each do |x|
            bits[x.hex] = 1
        end
    end

    def contains?(item)
        hash = Digest::MD5.hexdigest item
        hash.scan(/.{1,4}/).all? { |x| bits[x.hex] == 1 }
    end
end

class Dictionary
    attr_accessor :words, :filter

    def initialize
        @words = []
        @filter = BloomFilter.new
    end

    def add(word)
        unless in_dictionary?(word)
            words << word
            filter.insert(word)
        end
    end

    def in_dictionary?(word)
        filter.contains?(word) || words.include?(word)
    end
end
