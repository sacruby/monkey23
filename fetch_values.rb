require "minitest/autorun"
# ruby -Ilib:test fetch_values.rb

class Hash

  def monkey_fetch_values(*keys)
    keys.map do |key|
      if self.has_key?(key)
        self[key]
      else
        raise KeyError
      end
    end
  end

end

describe Numeric do
  describe "#monkey_fetch_values" do
    before do
      @hash = {a: 1, b: 2, c: 3, d: 4}
    end

    it "returns an array of values for the given keys" do
      @hash.monkey_fetch_values(:a, :b, :c, :d).must_equal [1,2,3,4]
    end

    it "returns an empty array if there are no arguments" do
      @hash.monkey_fetch_values().must_equal []
    end

    it "raises error if a key is not present" do
      proc { @hash.monkey_fetch_values(:d, :e) }.must_raise KeyError
    end

    it "doesn't raise an error if key is present with nil value" do
      @hash[:e] = false
      @hash[:f] = nil
      @hash.monkey_fetch_values(:d, :e, :f).must_equal [4, false, nil]
    end

    it "doesn't mutate the hash" do
      @hash.monkey_fetch_values(:a)
      @hash.must_equal(a: 1, b: 2, c: 3, d: 4)
    end
  end
end
