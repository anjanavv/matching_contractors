class CreateRequestedProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :requested_projects do |t|
      t.integer :renovation_project_id
      t.integer :contractor_id
      t.integer :contractor_accepted, default: 0
      t.integer :owner_interested, default: 0
      t.integer :project_awarded, default: 0

      t.timestamps
    end
  end
end
