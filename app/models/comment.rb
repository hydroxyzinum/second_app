class Comment < ApplicationRecord
  acts_as_votable
  belongs_to :post
  belongs_to :user
  validates :name, presence: true, length: { maximum: 20 }
  validates :body, presence: true
  default_scope -> { order(:cached_votes_up => :desc) }

end
