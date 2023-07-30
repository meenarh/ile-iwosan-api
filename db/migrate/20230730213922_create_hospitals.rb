class CreateHospitals < ActiveRecord::Migration[7.0]
  def change
    create_table :hospitals do |t|
      t.string :new_hospital
      t.string :name
      t.string :address
      t.string :contact_number
      t.string :website
      t.string :services
      t.string :department

      t.timestamps
    end
  end
end
