class CreateDiscounts < ActiveRecord::Migration[6.0]
  def change
    create_table :discounts do |t|
      t.integer :amount
      t.date :start_discount_date
      t.integer :duration

      t.timestamps
    end
  end
end
