class Alignment
  attr_reader :moral_dimension,
              :ethical_dimension

  alias :goodness :moral_dimension
  alias :lawfulness :ethical_dimension

  def initialize( args = {} )
    @moral_dimension =
        if args[:moral_dimension]
          args[:moral_dimension]
        elsif args[:goodness]
          args[:goodness]
        else
          50
        end
    @moral_dimension =
        case @moral_dimension
          when 'good' then 75
          when 'neutral' then 50
          when 'evil' then 25
        end

    @ethical_dimension =
        if args[:ethical_dimension]
          args[:ethical_dimension]
        elsif args[:lawfulness]
          args[:lawfulness]
        else
          50
        end
    @ethical_dimension =
        case @ethical_dimension
          when 'lawful' then 75
          when 'neutral' then 50
          when 'chaotic' then 25
        end
  end

  def to_s
    alignment = ''
    case @ethical_dimension
      when (0..30) then alignment += 'chaotic'
      when (31..69) then alignment += 'neutral'
      when (70..100) then alignment += 'lawful'
    end
    alignment += ' '
    case @moral_dimension
      when (0..30) then alignment += 'evil'
      when (31..69) then alignment += 'neutral'
      when (70..100) then alignment += 'good'
    end
    if alignment == 'neutral neutral'
      alignment = 'true neutral'
    end
    alignment
  end
end