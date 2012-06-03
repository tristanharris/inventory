class AddImagesToItem < ActiveRecord::Migration
  def change
    add_column :items, :store_image, :string
    add_column :items, :usage_image, :string
  end
end
