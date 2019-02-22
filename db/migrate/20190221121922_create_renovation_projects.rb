class CreateRenovationProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :renovation_projects do |t|
      t.string :name
      t.text :address
      t.float :latitude
      t.float :longitude
      t.float :min_budget
      t.float :max_budget
      t.boolean :design_services_needed
      t.boolean :build_services_needed

      t.timestamps
    end
  end
end
