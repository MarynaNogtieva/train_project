class ChangeAdminColumnUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :admin, :boolean, null: false
  end
end
