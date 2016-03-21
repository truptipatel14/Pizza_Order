class AddProvinceToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :Province, :string
  end
end
