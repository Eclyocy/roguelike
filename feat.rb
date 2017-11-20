require 'rexml/document'

class Feat
  attr_reader :name,
              :description

  alias :desc :description

  def initialize(args)
    @name = args[:name]
    @description = args[:desc]
  end

  def to_s
    "Feat:\n" +
        "\tName: #{@name}\n" +
        "\tDesc: #{@description}"
  end

  def self.generate
    feats = []
    REXML::Document.new(File.new('./rules.xml')).elements.each('rules/feats/feat') do |feat_xml|
      description =
          if feat_xml.elements['description']
            feat_xml.elements['description'].text
          else
            nil
          end
      feats.push Feat.new({
                              name: feat_xml.elements['name'].text,
                              description: description
                          })
    end
    feats
  end
end