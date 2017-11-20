# Handles the table RPG dice rolling.
class Die

  # Generates an array of random numbers by dice
  # description given in a string like '4d8' or '2d+10'.
  def self.roll(expression)
    if valid?(expression)
      amount, sides, increment = expression.scan(/\d+/)
      return amount.to_i.times.map { 1 + Random.rand( sides.to_i ) + increment.to_i }
    else
      raise "Could not parse: #{expression}"
    end
  end

  private

  # Validates dice description given that dice could be
  # 4, 6, 8, 10, 12, or 20-sided only.
  #--
  # TODO: if the increment could be negative, tune the second regex
  def self.valid?(expression)
    return expression =~ /^\d+d(4|6|8|10|12|20)$/ ||
        expression =~ /^\d+d(4|6|8|10|12|20)\+\d+$/
  end
end