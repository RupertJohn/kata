class Weather
    attr_accessor :max_temps, :min_temps, :average_temps

    def initialize(max_temps, min_temps, average_temps)
        @max_temps = max_temps
        @min_temps = min_temps
        @average_temps = average_temps
    end

    def temperature_spreads
        @temperature_spreads ||= calculate_spread
    end

    def max_spread
        temperature_spreads.max
    end

    def min_spread
        temperature_spreads.min
    end

    def max_spread_day
        temperature_spreads.find_index(max_spread) + 1
    end

    def min_spread_day
        temperature_spreads.find_index(min_spread) + 1
    end

    private

        def calculate_spread
            max_temps.zip(min_temps).map do |max, min|
                max - min
            end
        end
end
