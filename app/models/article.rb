class Article < ApplicationRecord
  has_many :comments, dependent: :destroy # dzieki relacji, przy usuwaniu artykulu usuwamy tez komentarze
  validates :title, presence: true, length: { minimum: 5 }
end
