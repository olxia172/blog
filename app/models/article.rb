class Article < ApplicationRecord
  has_many :comments, dependent: :destroy # dzieki relacji, przy usuwaniu artykulu usuwamy tez komentarze
  has_many :likes
  has_many :users, through: :likes # laczy uzytkownikow przez lajki, ktore saposrednim modelem laczacym uzytkownikow i artykuly
  belongs_to :author, class_name: "User" # nie ma modelu autor, ale jest model user, dlatego bezpośrenio każemy, żeby autor odnosił się bęzpośrenio do modelu user
  validates :title, presence: true, length: { minimum: 5 }

  mount_uploader :banner, BannerUploader

  def tags=(value)
    value = sanitize_tags(value) if value.is_a?(String)
    super(value)
  end

  private

  def sanitize_tags(value)
    value.downcase.split.uniq
  end
end
