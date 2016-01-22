require "minitest/autorun"
# ruby -Ilib:test dig.rb

class Hash
end

describe Hash do
  describe "#monkey_dig" do
    it "returns the nested value" do
      nested = {a: {b: {c: {d: 'f'}}}}
      nested.monkey_dig(:a, :b, :c, :d).must_equal 'f'
    end

    it "returns nil if any key in not present" do
      nested = {a: {b: {e: {d: 'f'}}}}
      nested.monkey_dig(:a, :b, :c, :d).must_equal nil
    end
  end
end
