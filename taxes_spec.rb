
# Path: taxes_spec.rb
require 'taxes'

describe Tax do
  it "calculates the tax" do
    Tax.calculate(10, 0.1).should == 1
  end
end

