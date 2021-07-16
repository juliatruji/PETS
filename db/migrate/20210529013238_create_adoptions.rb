class CreateAdoptions < ActiveRecord::Migration[6.1]
  def change
    create_table :adoptions do |t|
      t.date :date
      t.references :pet, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true
      t.references :adopter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
