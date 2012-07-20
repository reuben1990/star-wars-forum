class DropMessage < ActiveRecord::Migration
  def change
    drop_table :messages
  end
end
