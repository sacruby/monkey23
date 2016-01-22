require "minitest/autorun"
# ruby -Ilib:test hash_comparison.rb

class Hash

  def contains_subset?(hash)
    merge(hash) == self
    # (hash.to_a - to_a).empty? # alternate implementation
  end

end

describe Numeric do
  describe "#contains_subset?" do
    it "returns true if passed hash is subset of self" do
      hash = {a: 1, b: 2}
      hash.contains_subset?({a: 1}).must_equal true
    end

    it "returns false if passed hash is not subset of self" do
      hash = {a: 1, b: 2}
      hash.contains_subset?({a: 5}).must_equal false
    end
  end
end
