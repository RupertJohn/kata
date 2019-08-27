class FileHandler
    attr_accessor :file, :lines

    def initialize(filename, mode)
        @file = File.open(filename, mode)
    end

    def close
        file.close
    end

    def lines
        @lines ||= file.readlines
    end
end

class DatFileHandler < FileHandler
    def clean!
        lines.map! do |line|
            line.strip!
            line.gsub!(/\s+/, ",")
            line.split(",")
        end
        lines.reject! { |line| line.empty? }
    end
end
