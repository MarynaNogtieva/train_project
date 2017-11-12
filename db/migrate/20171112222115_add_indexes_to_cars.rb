class AddIndexesToCars < ActiveRecord::Migration[5.1]
  def change
    add_index :cars, [:id, :type] 
  end
end
