require './race'
require './feat'
require './klass'
require './character'
require './alignment'
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
  rogue = nil
  klasses.each do |klass|
    if klass.name == 'Rogue'
      rogue = klass
      break
    end
  end

  char = Character.new({
                           name: 'Frodo',
                           race: halfling,
                           klasses: [rogue],
                           alignment: Alignment.new(lawfulness: 0, goodness: 100)
                       })
  puts char
end