class DropWeibo < ActiveRecord::Migration
  def change
    drop_table :weibos
  end
end
