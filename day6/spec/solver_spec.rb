require "rspec"
require_relative "../solver"

RSpec.describe "Day 6 Part 1" do
  describe LightGrid do
    subject { LightGrid.new }

    it { expect(subject.instr("turn on 0,0 through 999,999").lights_on).to be 1_000_000 }
    it { expect(subject.instr("toggle 0,0 through 999,0").lights_on).to be 1_000 }
    it { expect(subject.instr("turn off 499,499 through 500,500").lights_on).to be 0 }
    it "turns off lights" do
      expect(subject.instr("turn on 0,0 through 999,999")
        .instr("turn off 499,499 through 500,500").lights_on
      ).to be 999_996
    end
  end
end
