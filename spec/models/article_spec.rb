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


  describe 'class methods' do 
    describe '::content_search' do

      before do
        Article.create!(title: "hello", contents:"blue", author: create(:member))
        Article.create!(title: "hello", contents:"blue blue green", author: create(:member)) 
        Article.create!(title: "hello", contents:"red green", author: create(:member)) 
      end

      it "includes only articles with the correct keyword" do
        expect(Article.content_search("blue").length).to eq(2)
      end

      it "orders them by occurance" do
        expect(Article.content_search("blue").first.contents).to eq("blue blue green")
      end

    end
  end




end