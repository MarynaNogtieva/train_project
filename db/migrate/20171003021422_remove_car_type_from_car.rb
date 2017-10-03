class RemoveCarTypeFromCar < ActiveRecord::Migration[5.1]
  def change
    remove_column :cars, :car_type, :string
  end
end
