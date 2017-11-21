class Alignment
  attr_reader :moral_dimension,
              :ethical_dimension,
              :title

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
          else @moral_dimension
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
          else @ethical_dimension
        end

    @title = title
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
    if @title
      alignment += " (#{@title})"
    end
    alignment
  end

  private

  def title
    case [@ethical_dimension, @moral_dimension]
      when [0, 0] then 'Destroyer'
      when [0, 50] then 'Free Spirit'
      when [0, 100] then 'Rebel'
      when [50, 0] then 'Malefactor'
      when [50, 50] then 'Reconciler'
      when [50, 100] then 'Benefactor'
      when [100, 0] then 'Dominator'
      when [100, 50] then 'Judge'
      when [100, 100] then 'Crusader'
      else nil
    end
  end
end