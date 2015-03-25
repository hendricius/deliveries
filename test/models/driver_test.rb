require "test_helper"

describe Driver do
  let(:driver) { Driver.new }

  it "must be valid" do
    driver.must_be :valid?
  end
end
