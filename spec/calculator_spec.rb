require_relative '../calculator'

RSpec.describe Calculator do
  subject { Calculator.new(sum) }

  describe '#calculate' do
    context 'two operands' do
      let(:sum) { "243 - 43" }

      it 'gives the correct result' do
        expect(subject.calculate).to eq(200)
      end
    end

    context 'chained operations' do
      let(:sum) { "20 ** 4 / 8" }

      it 'gives the correct result' do
        expect(subject.calculate).to eq(20000)
      end
    end

    context 'chained operations' do
      let(:sum) { "8 + 2 ** 4" }

      it 'gives the correct result' do
        expect(subject.calculate).to eq(24)
      end
    end

    context 'with parens' do
      let(:sum) { "(8 + 2) ** 4" }

      it 'gives the correct result' do
        expect(subject.calculate).to eq(10000)
      end
    end

    context 'with nested parens' do
      let(:sum) { "(8 + (2 - 1)) ** 4" }

      it 'gives the correct result' do
        expect(subject.calculate).to eq(6561)
      end
    end
  end
end
