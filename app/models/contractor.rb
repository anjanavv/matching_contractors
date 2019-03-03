class Contractor < ApplicationRecord
  
  has_many :requested_projects
  has_many :renovation_projects, through: :requested_projects
  
  geocoded_by :address
  after_validation :geocode
 
  validates_presence_of :name, :address, :min_budget, :max_budget
  
  scope :services_offered, ->(build_service, design_service) { where(:has_build_services => build_service,
    :has_design_services => design_service) }

  scope :price_range, ->(min, max) { where(["(? BETWEEN min_budget AND max_budget)
      OR (? BETWEEN min_budget AND max_budget)", min, max]).order('min_budget') }
end
