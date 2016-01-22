require "minitest/autorun"
# ruby -Ilib:test numeric_positive_negative.rb

class Numeric
end

describe Numeric do
  describe "#positive?" do
    it "returns true if a number is positive" do
      4.monkey_positive?.must_equal true
      0.monkey_positive?.must_equal false
    end
  end

  describe "#negative?" do
    it "returns true if a number is negative" do
      -4.monkey_negative?.must_equal true
      -0.monkey_negative?.must_equal false
    end
  end
end
