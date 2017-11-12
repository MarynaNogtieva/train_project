class RemoveEmailFromUser < ActiveRecord::Migration[5.1]
  change_table(:users) do |t|
    t.remove :email  
  end
end
