class Route < ActiveRecord::Base
  has_many :trains, dependent: :nullify
  # has_and_belongs_to_many :railway_stations
  has_many :railway_stations_routes, dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routes
  
  validates :name, presence: true
  validate :stations_count
  
  # creating route name on route creation
  before_validation :set_name
  
  private
  
  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end
  
  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Route should contain at least 2 stations")
    end
  end
  
  def stations_on_route
    railway_stations.ordered
  end
end