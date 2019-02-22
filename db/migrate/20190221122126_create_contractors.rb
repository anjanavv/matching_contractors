class CreateContractors < ActiveRecord::Migration[5.2]
  def change
    create_table :contractors do |t|
      t.string :name
      t.text :address
      t.float :latitude
      t.float :longitude
      t.float :min_budget
      t.float :max_budget
      t.boolean :has_design_services
      t.boolean :has_build_services

      t.timestamps
    end
  end
end
