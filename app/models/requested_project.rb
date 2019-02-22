class RequestedProject < ApplicationRecord
  
  belongs_to :contractors
  belongs_to :renovation_projects
  
end
