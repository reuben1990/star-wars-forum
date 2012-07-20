class DropStupidMessages < ActiveRecord::Migration
  def change
    drop_table :messages
  end
end
