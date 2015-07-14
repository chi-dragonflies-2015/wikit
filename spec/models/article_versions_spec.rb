require 'rails_helper'

describe Article do
  let(:article) { Article.create(title:"text", contents:"test-1-2-3",author_id: 1) }

  describe 'paper-trail-versions' do
    it 'saves versions' do
      article.update(contents:"testing 2-3-4")
      expect(article.versions.length).to eq(2)
    end

    it 'returns the last version' do
      article.update(contents:"testing 2-3-4")
      expect(article.previous_version.contents).to eq('test-1-2-3')
    end      

  end


end
