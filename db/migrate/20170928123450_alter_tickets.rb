class AlterTickets < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :tickets, :start_station, index: true
    add_belongs_to :tickets, :end_station, index: true
    add_belongs_to :tickets, :user, index: true
  end
end
