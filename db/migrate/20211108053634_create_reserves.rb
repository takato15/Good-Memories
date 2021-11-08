class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|

      t.integer :customer_id
      t.integer :plan_id
      t.integer :count
      t.datetime :reserve_day
      t.integer :billing
      t.integer :payment
      t.string :name
      t.string :post_cord
      t.string :address

      t.timestamps
    end
  end
end
