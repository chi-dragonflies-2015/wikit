require 'rails_helper'

describe Tag do

  describe 'validations' do
    it "is not valid when it does not have a name" do
      article = build(:article)
      tag = Tag.new(article: article)
      expect(tag.save).to be(false)
    end

    it "is valid when it does have a name" do 
      article = build(:article)
      tag = Tag.new(article: article, name: "history")
      expect(tag.save).to be(true)
    end
  end

end