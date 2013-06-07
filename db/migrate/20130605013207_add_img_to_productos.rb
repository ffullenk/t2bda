class AddImgToProductos < ActiveRecord::Migration
  def change
    add_column :productos, :img, :string
  end
end
