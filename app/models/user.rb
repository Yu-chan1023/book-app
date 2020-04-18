class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likes_books, through: :likes, source: :book
  mount_uploader :image, ImageUploader
  def already_liked?(book)
    self.likes.exists?(book_id: book.id)
  end
end
