class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|

      t.integer :tag_id

      t.timestamps
    end
  end
end
