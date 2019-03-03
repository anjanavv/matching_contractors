class RenovationProject < ApplicationRecord
  
  has_many :requested_projects
  has_many :contractors, through: :requested_projects
  
  geocoded_by :address
  after_validation :geocode
  
  validates_presence_of :name, :address, :min_budget, :max_budget
  
  def matching_contractors
    Contractor.price_range(min_budget, max_budget).
      services_offered(build_services_needed, design_services_needed).
      near(address, 500).limit(3)
  end

end
