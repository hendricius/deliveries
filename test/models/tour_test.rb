require "test_helper"

describe Tour do
  let(:tour) { Tour.new }

  it "must be valid" do
    tour.must_be :valid?
  end
end
