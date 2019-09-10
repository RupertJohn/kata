class SoccerLeague
    attr_accessor :teams

    def initialize(teams)
        @teams = teams
    end

    def min_spread
        min_val = 1000
        team = ''
        teams.each do |k, v|
            if (v[0] - v[1]).abs < min_val
                team = k
                min_val = (v[0] - v[1]).abs
            end
        end
        team
    end
end
