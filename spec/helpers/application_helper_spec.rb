require 'rails_helper'

describe ApplicationHelper, :type => :helper do
  describe "#full_title" do
    it "returns default title when none is provided" do
      expect(helper.full_title).to eq "Wikit"
    end

    it "returns page title when one is provided" do
      expect(helper.full_title("My Title")).to eq "My Title | Wikit"
    end

  end
end
