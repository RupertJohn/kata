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
    attr_accessor :headers, :data_start_indexes

    def initialize(filename, mode)
        super
        clean!
        @lines = @lines[1..-1]
    end

    def clean!
        @headers = lines[0].scan(/\w+/)
        @data_start_indexes = find_columns
        lines.map! do |line|
            next unless line.length > data_start_indexes[-1]
            split_line(line)
        end
        lines.reject!(&:nil?)
    end

    def find_columns
        lines[0].scan(/\s\w+/).map do |header|
            self.lines[0].index(header)
        end
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

    private

        def split_line(line)
            data_start_indexes.reverse.each_with_object([]) do |x, split_line|
                split_line.unshift(line.slice!(x..-1).strip)
            end
        end
end
