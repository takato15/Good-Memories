class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      
      t.string :name
      t.text :caption
      t.integer :price
      t.integer :image_id

      t.timestamps
    end
  end
end
