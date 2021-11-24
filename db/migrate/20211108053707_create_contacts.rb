class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|

      t.integer :customer_id
      t.string :title
      t.text :detail
      t.string :title_reply
      t.text :detail_reply

      t.timestamps
    end
  end
end
