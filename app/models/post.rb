class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true
  self.per_page = 6
end
