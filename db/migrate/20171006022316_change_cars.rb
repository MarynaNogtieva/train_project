class ChangeCars < ActiveRecord::Migration[5.1]
  def change
    # rename_column :cars, :is_econom, :car_type 
    change_column :cars, :car_type, :string, :limit => 30
  end
end
