class Character
  attr_reader :name,
              :race, # Race object
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
    @race = args[:race]
    @experience =
        if args[:experience]
          args[:experience]
        elsif args[:xp]
          args[:xp]
        else
          0
        end
    @klasses = args[:klasses]
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
        "\tRace: #{@race.name}\n" +
        "\tXP: #{@experience}\n" +
        "\tClasses: #{@klasses.map { |klass| klass.name } }\n" +
        "\tAlignment: #{@alignment}\n" +
        "\tDeity: #{@deity}\n" +
        "\tAbilities: #{@abilities}\n" +
        "\tCurrent Abilities: #{current_abilities}\n" +
        "\tHP: #{@hit_points}\n" +
        "\tAC: #{@armor_class}"
  end

  # Returns character level based on character XP
  def level
    case @experience
      when 0..999 then 1
      when 1000..2999 then 2
      when 3000..5999 then 3
      when 6000..9999 then 4
      when 10000..14999 then 5
      when 15000..20999 then 6
      when 21000..27999 then 7
      when 28000..35999 then 8
      when 36000..44999 then 9
      when 45000..54999 then 10
      when 55000..65999 then 11
      when 66000..77999 then 12
      when 78000..90999 then 13
      when 91000..104999 then 14
      when 105000..119999 then 15
      when 120000..135999 then 16
      when 136000..152999 then 17
      when 153000..170999 then 18
      when 171000..189999 then 19
      when 190000 then 20
      else
        raise 'Unsupported'
    end
  end
end