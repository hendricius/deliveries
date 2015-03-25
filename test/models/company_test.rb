require "test_helper"

describe Company do
  let(:company) { Company.new }

  it "must be valid" do
    company.must_be :valid?
  end
end
