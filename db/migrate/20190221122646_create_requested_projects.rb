class CreateRequestedProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :requested_projects do |t|
      t.integer :renovation_project_id
      t.integer :contractor_id
      t.boolean :contractor_accepted
      t.boolean :owner_interested

      t.timestamps
    end
  end
end
