class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :cover_url, :complete_date, :review_url
  root :books
end
