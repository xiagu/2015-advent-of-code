require "rspec"
require_relative "../solver2"

RSpec.describe "Day 6 Part 2" do
  describe LightGrid do
    it { expect(subject.instr("turn on 0,0 through 999,999").brightness).to be 1_000_000 }
    it { expect(subject.instr("toggle 0,0 through 999,0").brightness).to be 2_000 }
    it { expect(subject.instr("turn off 499,499 through 500,500").brightness).to be 0 }
    it "turns off lights" do
      expect(subject.instr("turn on 0,0 through 999,999")
        .instr("turn off 499,499 through 500,500").brightness
      ).to be 999_996
    end
  end
end
