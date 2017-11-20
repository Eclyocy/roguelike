require './race'
require './feat'
require './klass'
require './character'
require './die'

class Game
  races = Race.generate
  feats = Feat.generate
  klasses = Klass.generate
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

  klasses.each do |klass|
    puts klass
  end
end