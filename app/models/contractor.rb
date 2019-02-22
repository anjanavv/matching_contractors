class Contractor < ApplicationRecord
  
  has_many :requested_projects
  has_many :renovation_projects, through: :requested_projects
  
  validates_presence_of :name, :address, :latitude, 
      :longitude, :min_budget, :max_budget
end
