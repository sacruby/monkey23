require "minitest/autorun"
# ruby -Ilib:test try.rb

class Object
  def try(*a)
    public_send(*a) if a.empty? || respond_to?(a.first)
  end
end

describe Object do
  describe "#try" do
    it "returns nil instead of exception" do
      [].try(:first).try(:last).must_equal nil
    end
  end

  describe "#try" do
    it "returns nil instead of exception" do
      {}.try(:[], :some_key).try(:last).must_equal nil
    end

    it "returns the actual value for a passed in args" do
      {some_key: "some_value"}.try(:[], :some_key).must_equal "some_value"
    end
  end
end
