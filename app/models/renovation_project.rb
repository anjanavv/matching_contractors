class RenovationProject < ApplicationRecord
  
  has_many :requested_projects
  has_many :contractors, through: :requested_projects
end
