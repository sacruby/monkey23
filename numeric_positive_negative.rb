require "minitest/autorun"
# ruby -Ilib:test numeric_positive_negative.rb

class Numeric
end

describe Numeric do
  describe "#positive" do
    it "returns true if a nubmer is positive" do
      4.monkey_positive?.must_equal true
    end
  end
end
