class RequestedProject < ApplicationRecord
  
  belongs_to :contractor
  belongs_to :renovation_project
  
  validates :renovation_project_id, uniqueness: { scope: :contractor_id}
  
   
  def owner_status
    case owner_interested
    when 0
      "Awaits confirmation"
    when 1
      "Owner interested"
    when 2
      "Owner not interested"
    end
  end
  
  def contractor_status
    case contractor_accepted
    when 0
      "Awaits confirmation"
    when 1
      "Contractor accepted"
    when 2
      "Contractor not interested"
    end
  end
  
  def project_status
    case project_awarded
    when 0
      "Awaits confirmation"
    when 1
      "Project awarded"
    when 2
      "Not interested"
    end
  end
  
end
