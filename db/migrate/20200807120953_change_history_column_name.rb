class ChangeHistoryColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :histories, :buyer_id, :user_id
    rename_column :histories, :purchase_date, :purchase_at
  end
end
