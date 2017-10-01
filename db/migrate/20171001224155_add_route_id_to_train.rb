class AddRouteIdToTrain < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :trains, :route, index: true, null: true
  end
end
