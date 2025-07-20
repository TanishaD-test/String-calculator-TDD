require_relative './string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  it "returns 0 for empty string" do
    expect(calculator.add("")).to eq(0)
  end

  it "returns number for single number" do
    expect(calculator.add("1")).to eq(1)
  end

  it "returns sum for two comma-separated numbers" do
    expect(calculator.add("1,5")).to eq(6)
  end

  it "returns sum for multiple numbers" do
    expect(calculator.add("1,2,3,4")).to eq(10)
  end

  it "handles newlines as separators too" do
    expect(calculator.add("1\n2,3")).to eq(6)
  end

  it "raises error on single negative number" do
    expect { calculator.add("1,-2,3") }
      .to raise_error(ArgumentError, "negative numbers not allowed -2")
  end

  it "raises error on multiple negative numbers" do
    expect { calculator.add("1,-2,-5") }
      .to raise_error(ArgumentError, "negative numbers not allowed -2,-5")
  end
end
