class AddImageUrlToPlanets < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :image_url, :string
  end
end
