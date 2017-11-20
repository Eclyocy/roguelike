require 'rexml/document'

class Race
  attr_reader :name,
              :ability_adjustments,
              :feats, # TODO: array of Feat objects
              :favored_klass

  def initialize(args={})
    @name = args[:name]
    @ability_adjustments = args[:ability_adjustments] || {}
    @feats = args[:feats] || []
    @favored_klass = args[:favored_klass]
  end

  def to_s
    "Race:\n" +
        "\tName: #{@name}\n" +
        "\tAbility Adjustments: #{@ability_adjustments.any? ? @ability_adjustments : 'None'}\n" +
        "\tFeats: #{@feats.any? ? @feats : 'None'}\n" +
        "\tFavored Class: #{@favored_klass || 'Any'}"
  end

  def self.generate
    races = []
    REXML::Document.new(File.new('./rules.xml')).elements.each('rules/races/race') do |race_xml|
      # Ability adjustments
      ability_adjustments = {}
      if race_xml.elements['ability_adjustments']
        race_xml.elements['ability_adjustments'].elements.each do |element|
          ability_adjustments[element.name.to_sym] = element.text.to_i
        end
      end
      # Feats
      feats = []
      race_xml.elements.each('feats/feat') {|feat| feats.push feat.text}
      # Favored klass
      favored_klass = race_xml.elements['favored_class'] ? race_xml.elements['favored_class'].text : nil
      # Add Name and Description params and create race
      races.push Race.new({name: race_xml.elements['name'].text,
                           description: race_xml.elements['description'].text,
                           ability_adjustments: ability_adjustments,
                           feats: feats,
                           favored_klass: favored_klass})
    end
    races
  end
end