class CreateHospitalAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :hospital_admins do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.boolean :active
      t.date :token_expiration_date
      t.string :reset_password_token
      t.date :reset_password_sent_at
      t.integer :sign_in_count
      t.date :current_sign_in_at
      t.date :last_sign_in_at
      t.date :last_sign_out_at

      t.timestamps
    end
  end
end
