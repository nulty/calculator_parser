require 'pry'

class Calculator
  OPERATOR_PRECEDENCE = ['**', '*', '/', '+', '-']

  def initialize(sum)
    @str = sum
  end

  def calculate
    parse(@str)
  end

  def parse(str)
    if idx = str.index('(')
      ridx = str.rindex(')')
      subsum = str.slice!(idx, (ridx+1)-idx)[1..-2]

      res = parse(subsum)
      str.insert(idx, res.to_s)
    end

    parsed_sum = str.split(" ")
    sub_calculate(parsed_sum)
  end

  def sub_calculate(parsed)
    while parsed.length > 1
      OPERATOR_PRECEDENCE.each do |operator|
        idx = parsed.index(operator)

        next unless idx

        idx = idx - 1

        subsum = []

        3.times do
          subsum << parsed.delete_at(idx)
        end

        result = subsum[0].to_i.send(subsum[1], subsum[2].to_i)
        parsed.insert(idx, result)
      end
    end

    parsed.first
  end
end
