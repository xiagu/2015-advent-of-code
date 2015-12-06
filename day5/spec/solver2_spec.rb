require "rspec"
require_relative "../solver2"

RSpec.describe "Day 5 Part 2" do
  describe "nice?" do
    it { expect(nice?("qjhvhtzxzqqjkmpb")).to be_truthy }
    it { expect(nice?("xxyxx")).to be_truthy }
    it { expect(nice?("uurcxstgmygtbstg")).to be_falsey }
    it { expect(nice?("ieodomkazucvgmuy")).to be_falsey }
  end
end
