class Article < ActiveRecord::Base
  belongs_to :author, class_name: "Member"

  validates :contents, presence: true
  validates :author, presence:true
  
  # Returns an array of arrays, with the inner arrays as
  # [Article, # of Occurances]
  def self.content_search(keyword)  
    list = {}
    Article.all.each{ |article| list[article] = article.contents.downcase.scan(/#{keyword.downcase}/).length }
    Hash[list.select{ |_,value| value > 0 }.sort_by{ |_,value| value }].keys.reverse
  end



  has_paper_trail

end