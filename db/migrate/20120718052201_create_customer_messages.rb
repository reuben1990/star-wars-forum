class CreateCustomerMessages < ActiveRecord::Migration
  def change
    create_table :customer_messages do |t|
      t.string :title
      t.text :body
      t.references :user

      t.timestamps
    end
    add_index :customer_messages, :user_id
  end
end
