class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :car_type
      t.integer :top_seats
      t.integer :bottom_seats
      t.boolean :is_econom, default: true
      t.belongs_to :train, index: true
      t.timestamps 
      
    end
  end
end
