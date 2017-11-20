class Character
  attr_reader :name,
              :race,
              :experience,
              :klasses,
              :alignment,
              :deity,
              :abilities,
              :current_abilities,
              :hit_points,
              :armor_class

  alias :xp :experience
  alias :hp :hit_points
  alias :ac :armor_class

  def initialize( args = {} )
    @name = args[:name] || 'TestSubject'
    @race = args[:race] || 'human'
    @experience = args[:experience] || 0
    @klasses = args[:klasses] || ['Fighter']
    @alignment = args[:alignment] || 'True Neutral'
    @deity = args[:deity] || 'None'
    @abilities = args[:abilities] || {str: 8, dex: 8, con: 8, int: 8, wis: 8, cha: 8}
    @current_abilities = args[:current_abilities] || @abilities
    @hit_points = args[:hit_points] || 10
    @armor_class = args[:armor_class] || 0
  end

  def to_s
    "Character:\n" +
        "\tName: #{@name}\n" +
        "\tRace: #{@race}\n" +
        "\tXP: #{@experience}\n" +
        "\tClasses: #{@klasses}\n" +
        "\tAlignment: #{@alignment}\n" +
        "\tDeity: #{@deity}\n" +
        "\tAbilities: #{@abilities}\n" +
        "\tCurrent Abilities: #{current_abilities}\n" +
        "\tHP: #{@hit_points}\n" +
        "\tAC: #{@armor_class}"
  end

  puts Character.new
end