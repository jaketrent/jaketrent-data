class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :cover_url
      t.date :complete_date
      t.string :review_url

      t.timestamps
    end
  end
end
