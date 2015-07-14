require 'rails_helper'

describe Article do
  let(:article) { Article.new }
  let(:member) { Member.new }

  describe 'validations' do
    it "is valid when has a title, contents, and author" do
      article.title = "Test title"
      article.contents = "Test contents"
      article.author = member
      article.valid?
      expect(article.errors[:title]).to be_empty
      expect(article.errors[:contents]).to be_empty
      expect(article.errors[:author]).to be_empty
    end

    it "is valid when has just contents and author" do
      article.contents = "Test contents"
      article.author = member
      article.title = nil
      article.valid?
      expect(article.errors[:title]).to be_empty
      expect(article.errors[:contents]).to be_empty
      expect(article.errors[:author]).to be_empty
    end

    it 'is invalid when contents are empty' do
      article.title ="Test Title"
      article.author = member
      article.valid?
      expect(article.errors[:title]).to be_empty
      expect(article.errors[:contents]).to_not be_empty
      expect(article.errors[:author]).to be_empty
    end

    it 'is invalid when author does not exist' do
      article.title ="Test Title"
      article.contents = "Test Contents"
      article.valid?
      expect(article.errors[:title]).to be_empty
      expect(article.errors[:contents]).to be_empty
      expect(article.errors[:author]).to_not be_empty
    end
  end
end