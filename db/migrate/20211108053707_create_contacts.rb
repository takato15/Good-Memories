class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|

      t.integer :customer_id
      t.string :last_name
      t.string :first_name
      t.string :email
      t.text :detail

      t.timestamps
    end
  end
end