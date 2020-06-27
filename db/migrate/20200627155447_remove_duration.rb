class RemoveDuration < ActiveRecord::Migration[6.0]
  def change
    remove_column :stays, :duration
  end
end
