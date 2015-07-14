require 'rails_helper'

describe Article do
  let(:article) { create(:article) }

  describe 'paper-trail-versions' do
    it 'saves versions' do
      article.update(contents: "testing 2-3-4")
      expect(article.versions.length).to eq(2)
    end

    it 'returns the last version' do
      orig_article = article.dup
      article.update(contents: "testing 2-3-4")
      expect(article.previous_version.contents).to eq(orig_article.contents)
    end      

  end


end
