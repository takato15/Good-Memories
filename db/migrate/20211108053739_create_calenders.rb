class CreateCalenders < ActiveRecord::Migration[5.2]
  def change
    create_table :calenders do |t|

      t.boolean :title, default: false
      t.datetime :start_time

      t.timestamps
    end
  end
end
