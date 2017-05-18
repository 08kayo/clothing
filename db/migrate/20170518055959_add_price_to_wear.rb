class AddPriceToWear < ActiveRecord::Migration
  def change
    add_column :wears, :Price, :integer
  end
end
