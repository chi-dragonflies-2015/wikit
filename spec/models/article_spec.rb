require 'rails_helper'

describe Article do

  describe 'validations' do
    it "is valid when has a title, contents, and author" do
      member = build(:member)
      article = build(:article)

      article.valid?
      expect(article.errors[:title]).to be_empty
      expect(article.errors[:contents]).to be_empty
      expect(article.errors[:author]).to be_empty
    end

    it "is valid when has just contents and author" do
      member = build(:member)
      article = build(:article)
      article.title = nil
      article.valid?
      expect(article.errors[:title]).to be_empty
      expect(article.errors[:contents]).to be_empty
      expect(article.errors[:author]).to be_empty
    end

    it 'is invalid when contents are empty' do
      member = build(:member)
      article = build(:article)
      article.contents = nil
      article.valid?
      expect(article.errors[:title]).to be_empty
      expect(article.errors[:contents]).to_not be_empty
      expect(article.errors[:author]).to be_empty
    end

    it 'is invalid when author does not exist' do
      article = build(:article)
      article.author = nil
      article.valid?
      expect(article.errors[:title]).to be_empty
      expect(article.errors[:contents]).to be_empty
      expect(article.errors[:author]).to_not be_empty
    end
  end
end