class AddStayIdToDiscount < ActiveRecord::Migration[6.0]
  def change
    add_column :discounts, :stay_id, :integer
    add_index :discounts, :stay_id
  end
end
