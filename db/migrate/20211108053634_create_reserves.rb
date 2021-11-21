class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|

      t.integer :customer_id
      t.integer :plan_id
      t.integer :count
      t.datetime :reserve_day
      t.integer :plan_name

      t.timestamps
    end
  end
end
