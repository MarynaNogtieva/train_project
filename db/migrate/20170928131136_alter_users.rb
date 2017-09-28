class AlterUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column("users", "name", "first_name")
    add_column("users", "last_name", :string)
    add_column("users", "email", :string, :limit => 60)
  end
end
