class CreateVeterinaryAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :veterinary_appointments do |t|
      t.string :image
      t.string :control_type
      t.date :date
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
