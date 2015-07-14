class Article < ActiveRecord::Base
  belongs_to :author, class_name: "User"

  validates :contents, presence: true
  # validates :author, presence:true
  has_paper_trail
end