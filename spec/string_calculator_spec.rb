require_relative '../string_calculator'

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

  it "supports custom single-character delimiter" do
    expect(calculator.add("//;\n1;2")).to eq(3)
  end

  it "supports single custom delimiter longer than one char with brackets" do
    expect(calculator.add("//[***]\n1***2***3")).to eq(6)
  end

  it "supports single delimiter of any length without brackets" do
    expect(calculator.add("//***\n1***2***3")).to eq(6)
  end

  it "supports multiple delimiters" do
    expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
  end

  it "supports multiple delimiters longer than one character" do
    expect(calculator.add("//[**][%%]\n1**2%%3")).to eq(6)
  end

  it "raises error on single negative number" do
    expect { calculator.add("1,-2,3") }
      .to raise_error(ArgumentError, "negative numbers not allowed -2")
  end

  it "raises error on multiple negative numbers" do
    expect { calculator.add("1,-2,-5") }
      .to raise_error(ArgumentError, "negative numbers not allowed -2,-5")
  end

  it "ignores numbers greater than 1000" do
    expect(calculator.add("2,1001")).to eq(2)
    expect(calculator.add("1000,1001,5")).to eq(1005)
  end
end
