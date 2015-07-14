require 'rails_helper'

describe Article do
  let(:article) { Article.new }

  describe 'validations' do
    it "is valid when has a title and contents" do
      article.title = "Test title"
      article.contents = "Test contents"
      article.valid?
      expect(article.errors[:title]).to be_empty
      expect(article.errors[:contents]).to be_empty
    end

    it "is valid when has just contents" do
      article.contents = "Test contents"
      article.valid?
      expect(article.errors[:title]).to be_empty
      expect(article.errors[:contents]).to be_empty
    end

    it 'is invalid when contents are empty' do
      article.title ="Test Title"
      article.valid?
      expect(article.errors[:title]).to be_empty
      expect(article.errors[:contents]).to_not be_empty
    end
  end
end