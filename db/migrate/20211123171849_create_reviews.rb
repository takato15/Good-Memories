class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|

      t.string :title
      t.float :evaluation
      t.text :contents
      t.integer :customer_id

      t.timestamps
    end
  end
end
