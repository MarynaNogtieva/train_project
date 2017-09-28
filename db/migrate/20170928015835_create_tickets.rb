class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.decimal :price, precision: 5, scale: 2
      t.timestamps
    end
  end
end
