class AddLatitudeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :latitude, :float
    add_column :restaurants, :city, :string
    add_column :restaurants, :state, :string
    add_column :restaurants, :yelp_id, :string
    add_column :restaurants, :yelp_stars_url, :string
    add_column :restaurants, :name, :string
    add_column :restaurants, :address, :string
    add_column :restaurants, :zip_code, :string
    add_column :restaurants, :image_url, :string
    add_column :restaurants, :yelp_rating, :string
    add_column :restaurants, :foursquare_rating, :string
    add_column :restaurants, :foursquare_review, :string
    add_column :restaurants, :wifi, :boolean
    add_column :restaurants, :outdoor_area, :boolean
    add_column :restaurants, :category, :string
  end
end
