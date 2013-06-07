class Producto < ActiveRecord::Base
  attr_accessible :encodedsqlrow, :nombre, :precio
end
