class Book < ActiveRecord::Base

  default_scope { order("complete_date desc") }

  validates :title, :author, :description, presence: true
  validates :cover_url, format: /\Ahttps?:\/\/[^.]+\..+\z/
  validates :review_url, :affiliate_url, format: /\Ahttps?:\/\/[^.]+\..+\z/, allow_blank: true
  validates :complete_date, date: true

end
