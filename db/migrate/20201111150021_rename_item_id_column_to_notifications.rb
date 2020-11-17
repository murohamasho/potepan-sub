class RenameItemIdColumnToNotifications < ActiveRecord::Migration[6.0]
  def change
    rename_column :notifications, :item_id, :micropost_id
  end
end
