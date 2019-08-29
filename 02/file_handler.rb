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
    attr_accessor :headers

    def initialize(filename, mode)
        super
        clean!
        @headers = lines[0]
        @lines = @lines[1..-2]
    end

    def clean!
        lines.map! do |line|
            line.strip!
            line.gsub!(/\s+/, ",")
            line.split(",")
        end
        lines.reject!(&:empty?)
    end

    def method_missing(column_name, *arguments, &block)
        if headers.map(&:to_sym).include? column_name
            lines.map do |line|
                line[headers.index(column_name.to_s)]
            end
        else
            super
        end
    end

    def respond_to_missing?(column_name, include_private = false)
        headers.map(&:to_sym).include? column_name || super
    end
end
