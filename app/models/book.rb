class Book < ActiveRecord::Base

  validates :title, :author, :description, presence: true
  validates :cover_url, format: /\Ahttps?:\/\/[^.]+\..+\z/
  validates :review_url, :affiliate_url, format: /\Ahttps?:\/\/[^.]+\..+\z/, allow_blank: true
  validates :complete_date, date: true

end
