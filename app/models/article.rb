class Article < ActiveRecord::Base
  belongs_to :author, class_name: "Member"

  validates :contents, presence: true
  validates :author, presence:true

end