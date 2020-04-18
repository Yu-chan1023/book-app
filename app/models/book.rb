class Book < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true

  belongs_to :user, optional: true
  has_many :comments
  has_many :likes
  has_many :likes_users, through: :likes, source: :user

  def self.search(search)
    return Book.all unless search
    Book.where(['title LIKE ?', "%#{search}%"])
  end

end
