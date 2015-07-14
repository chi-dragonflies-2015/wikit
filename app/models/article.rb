class Article < ActiveRecord::Base
  belongs_to :author, class_name: "Member"

  validates :contents, presence: true
  validates :author, presence:true
  

  def self.content_search(keyword)  
    list = {}
    self.all.each{ |article| list[article] = article.content.scan(keyword).length }
    list.select{ |_,value| value > 0 }.sort{|a,b| b[1]<=>a[1]}
  end



  has_paper_trail

end