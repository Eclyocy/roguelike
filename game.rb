require './race'
require './feat'
require './character'
require './die'

class Game
  races = Race.generate
  feats = Feat.generate
  halfling = nil
  races.each do |race|
    if race.name == 'Halfling'
      halfling = race
      break
    end
  end
  char = Character.new({
                           name: 'Frodo',
                           race: halfling,
                           xp: 5999
                       })
  puts "xp: #{char.xp} level: #{char.level}"
end