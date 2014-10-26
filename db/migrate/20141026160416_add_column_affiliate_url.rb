class AddColumnAffiliateUrl < ActiveRecord::Migration
  def change
    add_column :books, :affiliate_url, :string
  end
end
