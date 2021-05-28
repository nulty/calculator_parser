require 'pry'

class Calculator
  OPERATOR_PRECEDENCE = ['**', '*', '/', '+', '-']

  def initialize(sum)
    @parsed_sum  = sum.split(" ")
  end

  def calculate
    while @parsed_sum.length > 1
      OPERATOR_PRECEDENCE.each do |operator|
        idx = @parsed_sum.index(operator)

        next unless idx

        idx = idx - 1

        subsum = []

        3.times do
          subsum << @parsed_sum.delete_at(idx)
        end

        result = subsum[0].to_i.send(subsum[1], subsum[2].to_i)
        @parsed_sum.insert(idx, result)
      end
    end

    @parsed_sum.first
  end
end
