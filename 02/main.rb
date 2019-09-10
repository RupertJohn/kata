require_relative './file_handler.rb'
require_relative './weather.rb'
require_relative './soccer_league.rb'

weather_data = DatFileHandler.new('weather.dat', 'r')
puts Weather.new(weather_data.MxT.map(&:to_i), weather_data.MnT.map(&:to_i), weather_data.AvT.map(&:to_i)).min_spread

football_data = DatFileHandler.new('football.dat', 'r')
teams = football_data.Team.zip(football_data.F.map(&:to_i).zip(football_data.A.map(&:to_i))).each_with_object({}) { |data, teams| teams[data[0]] = data[1] }

puts SoccerLeague.new(teams).min_spread
