require "minitest/autorun"
# ruby -Ilib:test grep_and_grep_v.rb

describe Array do
  describe "grep by exact match" do
    describe "#monkey_grep" do
      it "returns all elements that are equal to matchable" do
        [1, 2, 3, 1].grep(1).must_equal [1, 1]
      end
    end

    describe "#monkey_grep_v" do
      it "returns all elements that are not equal to matchable" do
        array = ['hello', 'world', 'I', 'am', 'here']
        array.monkey_grep_v(/l/).must_equal ['I', 'am', 'here']
      end
    end
  end

  describe "grep by regexp" do
    it "returns array of all elements that match regexp" do
      array = ['hello', 'world', 'I', 'am', 'here']
      array.monkey_grep(/l/).must_equal ['hello', 'world']
    end

    it "it ignores non-strings when matching regexp" do
      ["word", 9, {}, [], false, nil].grep(/o/).must_equal ["word"]
    end
  end

  describe "grep by range" do
    it "returns array of all elements that are included in range" do
      [2, 4, 6, 8].monkey_grep(3..7).must_equal [4, 6]
    end
  end

end

describe Range do
  describe "#monkey_grep" do
    it "returns an array of all values that equal the argument" do
      (1..3).monkey_grep(3).must_equal [3]
    end

    it "won't match the last value in a non-inclusive range" do
      (1...3).monkey_grep(3).must_equal []
    end

    describe "grep by range" do
      it "returns the intersection of the two ranges as an array" do
        (-5..5).monkey_grep(0..10).must_equal [0,1,2,3,4,5]
      end
    end
  end
end

describe Hash do
  describe "#monkey_grep" do
    it "returns an array of all key-value pairs that match the given key-value pair" do
      {a: 1, b: 2, c: 3}.monkey_grep([:b, 2]).must_equal [[:b, 2]]
    end
  end
end
