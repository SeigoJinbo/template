class AddImageUrlToStarships < ActiveRecord::Migration[6.0]
  def change
    add_column :starships, :image_url, :string
  end
end
