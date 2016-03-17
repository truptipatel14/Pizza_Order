class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :Address
      t.string :City
      t.string :PostalCode
      t.string :PhoneNumber
      t.string :Size
      t.string :Toppings
      t.string :Crust
      t.float :Price

      t.timestamps null: false
    end
  end
end
