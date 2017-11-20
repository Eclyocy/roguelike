class Klass
  attr_reader :name,
              :description,
              :alignment_restrictions, # one of the following: nil; any (non)lawful; any neutral; lawful good;
                                       # any evil or chaotic
              :hit_dice, # one of the following: d4, d6, d8, d10, d12
              :base_attack_bonus, # one of the following: Low, Medium, High
              :high_saves, # from 1 to 3 of the following: Fortitude, Reflex, Will ("High Saves: All" for all 3)
              :feats, # various
              :skill_points, # N+Int points gained at each level for skills upgrading; x4 at first level; N in {2,4,6,8}
              :class_skills, # list of skills for which level upgrade costs 1 point; others skills will cost 2 points
              :spells # various; could be nil (in case Character is non-mage)

  def initialize( args = {} )
    @name = args[:name]
    @description = args[:description]
    @alignment_restrictions = args[:alignment_restrictions]
    @hit_dice = args[:hit_dice]
    @base_attack_bonus = args[:base_attack_bonus]
    @high_saves = args[:high_saves]
    @feats = args[:feats]
    @skill_points = args[:skill_points]
    @class_skills = args[:class_skills]
    @spells = args[:spells]
  end

  def to_s
    "Class:\n" +
        "\tName: #{@name}"
  end

  def self.generate
    klasses = []
    REXML::Document.new(File.new('./rules.xml')).elements.each('rules/classes/class') do |klass_xml|
      klasses.push Klass.new({
                                 name: klass_xml.elements['name'].text
                             })
    end
    klasses
  end
end