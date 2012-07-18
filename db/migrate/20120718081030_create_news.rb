class CreateNews < ActiveRecord::Migration
  def change
    drop_table :news 
    create_table :news do |t|
      t.string :title
      t.text :body
      t.references :user

      t.timestamps
    end
    add_index :news, :user_id
  end
end
