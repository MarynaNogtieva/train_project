class AddSeatedSeatsToCar < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :seated_seats, :integer
  end
end
