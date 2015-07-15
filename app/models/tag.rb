class Tag < ActiveRecord::Base

  belongs_to :article

  validates :name, presence: true
  validates :article, presence: true



end