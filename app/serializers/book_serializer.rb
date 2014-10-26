class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :description, :cover_url, :complete_date, :review_url, :affiliate_url
  root :books
end
