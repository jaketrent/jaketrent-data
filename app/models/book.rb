class Book < ActiveRecord::Base

  validates :title, :description, presence: true
  validates :cover_url, format: /\Ahttps?:\/\/[^.]+\..+\z/
  validates :review_url, format: /\Ahttps?:\/\/[^.]+\..+\z/, allow_blank: true
  validates :complete_date, date: true

end